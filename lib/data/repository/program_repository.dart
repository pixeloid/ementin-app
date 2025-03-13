import 'dart:convert';

import 'package:ementin_flutter/data/api/dio_client.dart';
import 'package:ementin_flutter/data/api/shared_preference_helper.dart';
import 'package:ementin_flutter/data/endpoints.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/services/locator.dart';

import '../../models/schedule_model.dart';

class ProgramRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<Schedule> getProgram(EventModel event, DateTime? date) async {
    netWorkLocator.dio.options.extra['event'] = event.domain;
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.schedule}',
      queryParameters: {
        if (date != null) 'date': date,
      },
    );
    return Schedule.fromJson(response.data);
  }

  Future removeLike(int oldLike) async {
    final response = await netWorkLocator.dio.delete(
      '${EndPoints.baseUrl}${EndPoints.toggleLike}/$oldLike',
    );
    return response.data;
  }

  Future toggleFavourite(int id) async {
    final response = await netWorkLocator.dio.patch(
      '${EndPoints.baseUrl}${EndPoints.toggleLike}/$id',
      data: [],
    );
    return ScheduleEvent.fromJson(response.data);
  }

  Future addRate(value, ScheduleEvent programPresentation) async {
    final response = await netWorkLocator.dio
        .post('${EndPoints.baseUrl}${EndPoints.presentationRate}',
            data: json.encode({
              'presentation': programPresentation.id,
              'value': value.round(),
            }));
    return response.data;
  }

  Future rate(value, ScheduleEvent scheduleEvent) async {
    final response = await netWorkLocator.dio.patch(
        '${EndPoints.baseUrl}${EndPoints.presentationRate}/${scheduleEvent.eventId}',
        data: json.encode({
          'value': value.round(),
        }));
    return ScheduleEvent.fromJson(response.data);
  }
}
