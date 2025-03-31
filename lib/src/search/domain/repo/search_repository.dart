import 'package:health_mate/src/search/domain/entities/search_history.dart';

abstract class SearchRepository {
  Future<List<SearchHistory>> getSearchHistory();
  Future<void> addSearchHistory(String query);
  Future<void> removeSearchHistory(String query);
  Future<void> clearSearchHistory();
  Future<List<String>> searchConsultant(String query);
}
