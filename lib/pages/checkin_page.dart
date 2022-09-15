import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
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
    final programProvider =
        Provider.of<ProgramProvider>(context, listen: false);

    if (result != null) {
      controller!.pauseCamera();
      controller!.dispose();
      _checkIn(eventProvider, result!.code ?? '', authProvider, context);
    }
    AppConfig.shared.env;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppConfig.shared.env!.isProd || isLoading
          ? null
          : FloatingActionButton.extended(
              onPressed: () async {
                const code = 'ec9e5c7e339027514d089acf918e424a';
                final router = AutoRouter.of(context);

                setState(() {
                  // isLoading = true;
                });

                try {
                  await eventProvider.checkIn(code);
                  await authProvider.loginWithCode(code);

                  router.navigate(EventMainRoute(children: [
                    ProgramListRoute(
                        programData: programProvider
                            .getProgramForDay(eventProvider.eventDays.first))
                  ]));
                } catch (e) {
                  final snackBar = SnackBar(
                    content: Text(e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (mounted) {
                  Navigator.pop(context);
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              backgroundColor: Colors.primaries.first,
              label: const Text('Check in'),
              icon: const Icon(Icons.qr_code),
            ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Dismiss'),
                ),
                Expanded(
                  child: QRView(
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
                ),
              ],
            ),
    );
  }

  Future<void> _checkIn(EventProvider eventProvider, String code,
      AuthProvider authProvider, BuildContext context) async {
    final router = AutoRouter.of(context);
    var scaffoldText = const Text('Sikeres bejelentkezés!');
    setState(() {});

    try {
      await eventProvider.checkIn(code);
      await authProvider.loginWithCode(code);

      router.navigate(const RegistrationDetailsRoute());
    } catch (e) {
      scaffoldText = const Text('Sikertelen bejelentkezés!');
      setState(() {
        isLoading = false;
        result = null;
      });
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: scaffoldText,
      ));

      Navigator.pop(context);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
