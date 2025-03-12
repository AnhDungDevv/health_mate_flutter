import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/modules/interest_consultant_type/data/model/interest_consultant_type_model.dart';

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
}
