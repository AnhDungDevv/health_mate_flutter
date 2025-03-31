import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/data/repo/search_repository_impl.dart';
import 'package:health_mate/src/search/data/sources/search_local_data_source.dart';
import 'package:health_mate/src/search/data/sources/search_remote_data_source.dart';
import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';
import 'package:health_mate/src/search/domain/usecase/manage_search_history.dart';
import 'package:health_mate/src/search/domain/usecase/search_consultant.dart';
import 'package:health_mate/src/search/presentation/app/notifier/search_history_notifer.dart';
import 'package:health_mate/src/search/presentation/app/notifier/search_notifier.dart';

final searchRemoteDataProvider =
    Provider<SearchRemoteDataSource>((ref) => SearchRemoteDataSourceImpl());

final searchLocalDataProvider =
    Provider<SearchLocalDataSource>((ref) => SearchLocalDataSourceImpl());

final searchRepositoryProvider = Provider((ref) => SearchRepositoryImpl(
    ref.read(searchLocalDataProvider), ref.read(searchRemoteDataProvider)));

final searchConsultantUsecaseProvider = Provider<SearchConsultant>(
    (ref) => SearchConsultant(ref.read(searchRepositoryProvider)));

final searchManagerHistoryUsecaseProvider = Provider(
    (ref) => ManageSearchHistoryUseCase(ref.read(searchRepositoryProvider)));

final searchHistoryProvider = StateNotifierProvider<SearchHistoryNotifier,
        AsyncValue<List<String>>>(
    (ref) =>
        SearchHistoryNotifier(ref.read(searchManagerHistoryUsecaseProvider)));

final searchConsultantProvider = StateNotifierProvider<SearchNotifier,
    AsyncValue<List<ConsultantSearchRes>>>((ref) {
  return SearchNotifier(ref.watch(searchConsultantUsecaseProvider));
});
