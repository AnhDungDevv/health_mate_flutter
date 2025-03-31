import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';

abstract class SearchRepository {
  Future<List<String>> getSearchHistory();
  Future<void> addSearchHistory(String query);
  Future<void> removeSearchHistory(String query);
  Future<void> clearSearchHistory();
  Future<List<ConsultantSearchRes>> searchConsultant(String query);
}
