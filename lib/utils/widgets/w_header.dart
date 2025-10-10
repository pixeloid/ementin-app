import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/app_define/app_route.gr.dart';
import 'package:ementin_flutter/pages/checkin_page.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:ementin_flutter/utils/other/dynamic_size.dart';
import 'package:ementin_flutter/app_define/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

mixin HeaderDelegate {
  void onBack(BuildContext context);
}

class WHeader extends StatelessWidget with DynamicSize {
  const WHeader(
      {super.key,
      this.title,
      this.bgColor,
      this.isShowBackButton,
      this.topRight,
      this.delegate,
      this.showAuth = true});

  //#region Properties
  //-------------------
  final String? title;
  final Color? bgColor;
  final bool? isShowBackButton;
  final HeaderDelegate? delegate;
  final Widget? topRight;
  final bool showAuth;

  //#region BUILD
  //-------------------
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final tokenExipryDate = authProvider.getTokenExpiryDate();
    String? formattedTimeRemaining;
    if (tokenExipryDate != null) {
      final timeRemaining = tokenExipryDate.difference(DateTime.now());
      formattedTimeRemaining = DateFormat('HH:mm:ss').format(
        DateTime.fromMillisecondsSinceEpoch(timeRemaining.inMilliseconds,
            isUtc: true),
      );
    }

    //Init dynamic size
    initDynamicSize(context);
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Color(0xFFE5E7EB),
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 120.w,
                    child: isShowBackButton == true
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                if (delegate != null) {
                                  delegate?.onBack(context);
                                } else {
                                  //    context.navigator()?.pop();
                                }
                              },
                              child: Image.asset(
                                AppAssets.origin().icBack,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child:
                        Image.asset('assets/app/icons/ementin_logo_circle.png'),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Consumer<EventProvider>(
                      builder: (context, eventProvider, _) {
                        return (eventProvider.selectedEvent != null && showAuth)
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: !eventProvider.selectedEvent!.checkedIn
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(10, 26),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 13),
                                          backgroundColor:
                                              const Color(0xFFf172ac),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(CheckInOverlay());
                                        },
                                        child: SizedBox(
                                          child: Text(
                                            'Check-in'.toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : TextButton(
                                        onPressed: () async {
                                          final router = AutoRouter.of(
                                              context); // Store AutoRouter instance
                                          await Provider.of<AuthProvider>(
                                                  context,
                                                  listen: false)
                                              .logout();
                                          if (router.navigatorKey
                                                  .currentContext !=
                                              null) {
                                            router.navigate(
                                                const EventListRoute());
                                          }
                                        },
                                        child: const Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.logout_outlined,
                                          ),
                                        ),
                                      ),
                              )
                            : Container();
                      },
                    ),
                  )
                ],
              ),
              if (formattedTimeRemaining != null)
                // Container(
                //   padding: const EdgeInsets.symmetric(vertical: 8),
                //   child: Text(
                //     'Token expires in: $formattedTimeRemaining',
                //     style: const TextStyle(
                //       fontSize: 14,
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
                if (title != null)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title!.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              height: 1.2,
                              letterSpacing: -.5,
                              color: Color(0xFF315565),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckInOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => 'Barrrier label';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return const CheckInPage();
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
