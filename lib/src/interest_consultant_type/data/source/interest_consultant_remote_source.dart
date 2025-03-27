import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/interest_consultant_type/data/model/interest_consultant_type_model.dart';

class InterestConsultantRemoteSource {
  final Dio _dio = ApiClient().dio;
  Future<List<ConsultantTypeModel>> fetchConsultantTypes() async {
    final response = await _dio.get('consultant-types');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.data);
      return jsonData.map((e) => ConsultantTypeModel.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi server: ${response.statusCode}');
    }
  }

  Future<void> postSelectedInterests(
      String userId, List<String> interests) async {
    final res = await _dio.post(
      'selected-interests',
      data: {'user_id': userId, 'interests': interests},
    );
    if (res.statusCode! >= 200 && res.statusCode! < 400) {
    } else {
      throw Exception("error");
    }
  }
}
