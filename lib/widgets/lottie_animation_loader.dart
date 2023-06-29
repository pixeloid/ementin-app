import 'dart:math';

import 'package:eventapp/app_define/lottie_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Helpers

class LottieAnimationLoader extends StatelessWidget {
  const LottieAnimationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    const loaders = [
      LottieAssets.dogRounding,
      LottieAssets.movingBusLottie,
      LottieAssets.peopleTalkingLottie,
    ];
    final i = Random().nextInt(3);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          loaders[i],
        ),
      ),
    );
  }
}
