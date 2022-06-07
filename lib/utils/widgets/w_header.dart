import 'package:flutter/material.dart';
import 'package:eventapp/utils/other/dynamic_size.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
                height: 20.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 28.w,
                      height: 18.h,
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
                      height: 18.h,
                    )
                  ],
                ),
              ),
              Container(
                height: 70.h,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        title!.toUpperCase(),
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: -.5,
                            color: Color(0xFF315565)),
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
