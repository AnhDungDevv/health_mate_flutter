import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/data/sources/search_local_data_source.dart';
import 'package:health_mate/src/search/data/sources/search_remote_data_source.dart';
import 'package:health_mate/src/search/presentation/app/notifier/search_notifier.dart';

final searchReamoteDataProvider =
    Provider<SearchRemoteDataSource>((ref) => SearchRemoteDataSourceImpl());

final searchLocalDataProvider =
    Provider<SearchLocalDataSource>((ref) => SearchLocalDataSourceImpl());
final searchProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<List<String>>>((ref) {
  final useCase = ref.watch(searchUseCaseProvider);
  return SearchNotifier(useCase);
});
