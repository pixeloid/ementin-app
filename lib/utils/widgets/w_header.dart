import 'package:flutter/material.dart';
import 'package:eventapp/utils/other/dynamic_size.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin HeaderDelegate {
  void onBack(BuildContext context);
}

class WHeader extends StatelessWidget with DynamicSize {
  const WHeader(
      {Key? key,
      this.title,
      this.bgColor,
      this.isShowBackButton,
      this.delegate})
      : super(key: key);

  //#region Properties
  //-------------------
  final String? title;
  final Color? bgColor;
  final bool? isShowBackButton;
  final HeaderDelegate? delegate;

  //#region BUILD
  //-------------------
  @override
  Widget build(BuildContext context) {
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
                    width: 28.w,
                    child: isShowBackButton == true
                        ? InkWell(
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
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: Image.asset(
                        'assets/app/icons/ementin_logo_circle.png'),
                  ),
                  SizedBox(
                    width: 28.w,
                  )
                ],
              ),
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
