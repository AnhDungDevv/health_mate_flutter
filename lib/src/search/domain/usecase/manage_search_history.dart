import 'package:health_mate/src/search/domain/entities/search_history.dart';
import 'package:health_mate/src/search/domain/repo/search_repository.dart';

class ManageSearchHistory {
  final SearchRepository repository;

  ManageSearchHistory(this.repository);

  Future<List<SearchHistory>> getHistory() => repository.getSearchHistory();
  Future<void> addQuery(String query) => repository.addSearchHistory(query);
  Future<void> removeQuery(String query) =>
      repository.removeSearchHistory(query);
  Future<void> clearAll() => repository.clearSearchHistory();
}
