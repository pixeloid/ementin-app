import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:eventapp/app_define/app_config.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({Key? key}) : super(key: key);

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  Barcode? result;
  bool isLoading = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    if (result != null) {
      controller!.pauseCamera();
      controller!.dispose();
      _checkIn(eventProvider, result!.code ?? '', authProvider, context);
    }
    AppConfig.shared.env;

    return Scaffold(
      floatingActionButton: AppConfig.shared.env!.isProd
          ? null
          : FloatingActionButton(
              onPressed: () async {
                const code = 'cdf77b03dee14670470476721bf0778b';
                setState(() {
                  isLoading = true;
                });

                try {
                  await eventProvider.checkIn(code);
                  await authProvider.loginWithCode(code);

                  setState(() {
                    isLoading = false;
                  });

                  final router = AutoTabsRouter.of(context);

                  //   eventProvider.getEvents();

                  router.navigate(EventMainRoute(children: [
                    EventProgramRoute(date: eventProvider.eventDays.first)
                  ]));
                } catch (e) {
                  final snackBar = SnackBar(
                    content: Text(e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Icon(Icons.qr_code),
              backgroundColor: Colors.green,
            ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.orange,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
    );
  }

  Future<void> _checkIn(EventProvider eventProvider, String code,
      AuthProvider authProvider, BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      await eventProvider.checkIn(code);
      await authProvider.loginWithCode(code);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Sikertelen check-in'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        isLoading = false;
        result = null;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
