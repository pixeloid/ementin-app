import 'dart:async';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/models/instagram_feed/instagram_feed.dart';
import 'package:eventapp/services/locator.dart';

class InstaRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<List<InstagramFeed>> getFeed(String url) async {
    final response = await netWorkLocator.dio.get(url);

    final result = response.data
        .map<InstagramFeed>((e) => InstagramFeed.fromMap(e))
        .toList();

    return result;
  }
}
