import 'package:auto_route/auto_route.dart';
import 'package:eventapp/features/auth/application/auth_provider.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/utils/other/dynamic_size.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin HeaderDelegate {
  void onBack(BuildContext context);
}

class WHeader extends ConsumerWidget with DynamicSize {
  const WHeader({
    Key? key,
    this.title,
    this.bgColor,
    this.isShowBackButton,
    this.topRight,
    this.delegate,
    this.showAuth = true,
    this.drawerButton,
  }) : super(key: key);

  //#region Properties
  //-------------------
  final String? title;
  final Color? bgColor;
  final bool? isShowBackButton;
  final bool? drawerButton;
  final HeaderDelegate? delegate;
  final Widget? topRight;
  final bool showAuth;

  //#region BUILD
  //-------------------
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authProvider = Provider.of<AuthProvider>(context, listen: false);
    //final tokenExipryDate = authProvider.getTokenExpiryDate();
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
                    width: 50.w,
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
                  if (title != null)
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

                  SizedBox(
                    width: 120.w,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: !ref.watch(isLoggedInProvider)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(10, 26),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 13),
                                backgroundColor: const Color(0xFFf172ac),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(CheckInOverlay());
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
                              onPressed: () {
                                ref.read(authProvider.notifier).logout(
                                    onSuccess: () =>
                                        AutoRouter.of(context).popUntilRoot());
                              },
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.logout_outlined,
                                ),
                              ),
                            ),
                    ),
                  ),
                  if (drawerButton != null)
                    EndDrawerButton(
                      style: IconButton.styleFrom(iconSize: 24),
                    ),
                  // SizedBox(
                  //   width: 32.w,
                  //   height: 32.h,
                  //   child:
                  //       Image.asset('assets/app/icons/ementin_logo_circle.png'),
                  // ),
                ],
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
