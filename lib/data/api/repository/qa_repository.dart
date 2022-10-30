import 'dart:convert';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/services/locator.dart';

import '../network_exceptions.dart';

class QARepository {
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

  Future<dynamic> getQASession(int id) async {
    try {
      final response = await netWorkLocator.dio
          .get('${EndPoints.baseUrl}${EndPoints.qaSession}/$id');

      return response.data;
    } catch (e) {
      throw Exception(
        NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }

  Future<dynamic> postQuestion(String text, String? iri) async {
    try {
      final response = await netWorkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.qaEntry}',
              data: json.encode({
                'content': text,
                'qasession': iri,
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
}
