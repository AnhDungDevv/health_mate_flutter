import 'package:health_mate/src/search/domain/repo/search_repository.dart';

class ManageSearchHistoryUseCase {
  final SearchRepository repository;

  ManageSearchHistoryUseCase(this.repository);

  Future<List<String>> getHistory() => repository.getSearchHistory();
  Future<void> addQuery(String query) => repository.addSearchHistory(query);
  Future<void> removeQuery(String query) =>
      repository.removeSearchHistory(query);
  Future<void> clearAll() => repository.clearSearchHistory();
}
