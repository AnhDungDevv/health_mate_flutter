import 'package:health_mate/src/search/data/sources/search_local_data_source.dart';
import 'package:health_mate/src/search/data/sources/search_remote_data_source.dart';
import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';
import 'package:health_mate/src/search/domain/repo/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalDataSource dataLocalSource;
  final SearchRemoteDataSource dataRemoteSource;

  SearchRepositoryImpl(this.dataLocalSource, this.dataRemoteSource);

  @override
  Future<List<String>> getSearchHistory() async {
    try {
      final res = await dataLocalSource.getSearchHistory();
      return res;
    } catch (e) {
      throw Exception('Failed to fetch search history');
    }
  }

  @override
  Future<void> addSearchHistory(String query) async {
    await dataLocalSource.addSearchHistory(query);
  }

  @override
  Future<void> removeSearchHistory(String query) async {
    await dataLocalSource.removeSearchHistory(query);
  }

  @override
  Future<void> clearSearchHistory() async {
    await dataLocalSource.clearSearchHistory();
  }

  @override
  Future<List<ConsultantSearchRes>> searchConsultant(String query) async {
    try {
      final res = await dataRemoteSource.searchConsultant(query);
      return res.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception("Failed to search consultants: $e");
    }
  }
}
