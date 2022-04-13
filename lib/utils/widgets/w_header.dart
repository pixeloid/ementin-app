import 'package:flutter/material.dart';
import 'package:eventapp/utils/other/dynamic_size.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:eventapp/app_define/app_color.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/app_define/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin HeaderDelegate {
  void onBack();
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
        color: bgColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 40.h,
            ),
            SizedBox(
              height: 44.h,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 44.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            title ?? '',
                            //    style: boldTextStyle(16.SP, color: AppColors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 17.w,
                        ),
                        SizedBox(
                          width: 28.w,
                          height: 18.h,
                          child: InkWell(
                            onTap: () {
                              if (delegate != null) {
                                delegate?.onBack();
                              } else {
                                //    context.navigator()?.pop();
                              }
                            },
                            child: (isShowBackButton == true)
                                ? Image.asset(AppAssets.origin().icBack)
                                : Container(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
