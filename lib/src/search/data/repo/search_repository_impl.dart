import 'package:health_mate/src/search/data/sources/search_local_data_source.dart';
import 'package:health_mate/src/search/data/sources/search_remote_data_source.dart';
import 'package:health_mate/src/search/domain/entities/search_history.dart';
import 'package:health_mate/src/search/domain/repo/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalDataSource dataLocalSource;
  final SearchRemoteDataSource dataRemoteSource;

  SearchRepositoryImpl(this.dataLocalSource, this.dataRemoteSource);

  @override
  Future<List<SearchHistory>> getSearchHistory() async =>
      await dataLocalSource.getSearchHistory();

  @override
  Future<void> addSearchHistory(String query) async =>
      await dataLocalSource.addSearchHistory(query);

  @override
  Future<void> removeSearchHistory(String query) async =>
      await dataLocalSource.removeSearchHistory(query);

  @override
  Future<void> clearSearchHistory() async =>
      await dataLocalSource.clearSearchHistory();

  @override
  Future<List<String>> searchConsultant(String query) async {
    final response = await dataRemoteSource.searchConsultant("search?q=$query");
    return List<String>.from(response['results']);
  }
}
