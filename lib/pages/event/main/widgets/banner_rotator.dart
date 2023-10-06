import 'package:eventapp/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class BannerRotator extends StatefulWidget {
  final List<AdModel> ads;
  final Duration rotationDuration;

  const BannerRotator({
    super.key,
    required this.ads,
    required this.rotationDuration,
  });

  @override
  BannerRotatorState createState() => BannerRotatorState();
}

class BannerRotatorState extends State<BannerRotator> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: GestureDetector(
        onTap: () => widget.ads[_currentIndex].url != null
            ? _openUrl(widget.ads[_currentIndex].url)
            : null,
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: CachedNetworkImage(
            imageUrl:
                "https://home.ementin.hu${widget.ads[_currentIndex].image}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Start the timer to rotate images every 5 seconds
    _timer = Timer.periodic(widget.rotationDuration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.ads.length;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  _openUrl(url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
