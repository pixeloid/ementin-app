import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eventapp/models/instagram_feed.dart';

class InstaRepository {
  final dio = Dio();

  Future<List<InstagramFeed>> getFeed(String url) async {
    final response = await dio.get(url);

    final result = response.data
        .map<InstagramFeed>((e) => InstagramFeed.fromMap(e))
        .toList();

    return result;
  }
}
