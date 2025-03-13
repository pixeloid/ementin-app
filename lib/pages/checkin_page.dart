import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/app_define/app_route.gr.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ementin_flutter/app_define/app_config.dart';

@RoutePage()
class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  Barcode? result;
  bool isLoading = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        result = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    if (result != null && result!.rawValue != null) {
      _checkIn(
          eventProvider, result!.rawValue.toString(), authProvider, context);
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
                  child: MobileScanner(
                    onDetect: _handleBarcode,
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
    super.dispose();
  }
}
