import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:eventapp/app_define/app_config.dart';

@RoutePage()
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppConfig.shared.env!.isProd || isLoading
          ? FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            )
          : FloatingActionButton.extended(
              onPressed: () async {
                const code = '3c5e6e0fd139a831c0215c560badd19b';
                _checkIn(eventProvider, code, authProvider, context);
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
    setState(() {
      isLoading = true;
      result = null;
    });

    try {
      final checkIn = await eventProvider.checkIn(code);

      OneSignal.login(checkIn['eventRegistration']['user']['id'].toString())
          .then((results) {})
          .catchError((error) {});

      // Move this outside of setState
      await authProvider.loginWithCode(code);

      // The rest of your code remains unchanged

      if (mounted) {
        AutoRouter.of(context).navigate(EventProgramRoute());
        Navigator.pop(context);

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      var scaffoldText = const Text('Sikertelen bejelentkezés!');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: scaffoldText,
      ));

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
