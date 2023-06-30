import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:eventapp/app_define/app_config.dart';

import '../features/event/application/event_provider.dart';

class CheckInPage extends ConsumerStatefulWidget {
  const CheckInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends ConsumerState<CheckInPage> {
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
    if (result != null) {
      controller!.pauseCamera();
      controller!.dispose();
      _checkIn(result!.code ?? '', context);
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
                const code = '991f256c9e7b2398aa336a04f0a87df9';
                _checkIn(code, context);
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

  Future<void> _checkIn(String code, BuildContext context) async {
    setState(() {
      isLoading = true;
      result = null;
    });

    try {
      final currentEvent = ref.watch(currentEventProvider);
      final checkIn = await ref
          .watch(eventListProvider.notifier)
          .checkInAndLogin(currentEvent!.id, code);

      await OneSignal.shared
          .setExternalUserId(
              checkIn['eventRegistration']['user']['id'].toString())
          .then((results) {})
          .catchError((error) {});

      //    router.navigate(const RegistrationDetailsRoute());
    } catch (e) {
      setState(() {
        result = null;
      });

      var scaffoldText = const Text('Sikertelen bejelentkezés!');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: scaffoldText,
      ));
    }

    if (mounted) {
      setState(() {
        //  isLoading = false;
        result = null;
      });
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
