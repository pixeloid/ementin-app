import 'dart:convert';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/services/locator.dart';

import '../api/network_exceptions.dart';

class PollRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<dynamic> sendResponse(String id) async {
    try {
      final response = await netWorkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.pollResponse}',
              data: json.encode({
                'pollOption': id,
              }));
      return response.data;
    } catch (e) {
      throw Exception(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<dynamic> getPollSession() async {
    try {
      final response = await netWorkLocator.dio
          .get('${EndPoints.baseUrl}${EndPoints.pollSession}');

      return response.data;
    } catch (e) {
      throw Exception(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
