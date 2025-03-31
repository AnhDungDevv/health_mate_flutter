import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/search/data/models/consultant_search_res_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<ConsultantSearchResModel>> searchConsultant(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio _dio = ApiClient().dio;
  @override
  Future<List<ConsultantSearchResModel>> searchConsultant(String query) async {
    try {
      final res = await _dio
          .get('/search-consultant', queryParameters: {'query': query});
      if (res.statusCode! >= 200 && res.statusCode! < 400) {
        return (res.data as List)
            .map((item) => ConsultantSearchResModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      throw Exception('Failed to fetch consultants: $e');
    }
    throw Exception('Unexpected error occurred');
  }
}
