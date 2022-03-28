import 'package:flutter/material.dart';
import 'package:eventapp/utils/other/dynamic_size.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:eventapp/app_define/app_color.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/app_define/app_style.dart';

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
              height: 40.H,
            ),
            SizedBox(
              height: 44.H,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 44.H,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title ?? '',
                          style: boldTextStyle(20.SP, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44.H,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 17.W,
                        ),
                        SizedBox(
                          width: 28.W,
                          height: 18.H,
                          child: InkWell(
                            onTap: () {
                              if (delegate != null) {
                                delegate?.onBack();
                              } else {
                                //      context.navigator()?.pop();
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
