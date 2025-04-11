import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/data/repos/online_status_repository_impl.dart';
import 'package:health_mate/src/home/data/repos/recommended_consultant_repository_impl.dart';
import 'package:health_mate/src/home/data/sources/recommended_consultant_remote_source.dart';
import 'package:health_mate/src/home/data/sources/ws_source.dart';
import 'package:health_mate/src/home/doamin/entity/recommended_consultant_with_status_entity.dart';
import 'package:health_mate/src/home/doamin/repos/online_status_repository.dart';
import 'package:health_mate/src/home/doamin/repos/recommended_consultant_repository.dart';
import 'package:health_mate/src/home/doamin/usecase/get_recommended_consultants_usecase.dart';
import 'package:health_mate/src/home/doamin/usecase/get_top_rated_consultants_usecase.dart';
import 'package:health_mate/src/home/doamin/usecase/stream_consultant_status_usecase.dart';
import 'package:health_mate/src/home/presentation/app/notifiers/recommended_consultant_list_notifier.dart';
import 'package:health_mate/src/home/presentation/app/notifiers/top_consultant_list_notifier.dart';

// ws
final onlineStatusRemoteSourceProvider =
    Provider((ref) => OnlineStatusRemoteSource());
// recommend remote
final recommendedConsultantRemoteSourceProvider =
    Provider<RecommendedConsultantRemoteSource>(
  (ref) => RecommendedConsultantRemoteSource(),
);

// repository ws
final onlineStatusRepositoryProvider = Provider<IOnlineStatusRepository>(
  (ref) =>
      OnlineStatusRepositoryImpl(ref.read(onlineStatusRemoteSourceProvider)),
);

// reposotiry remote recommned
final getRecommendedConsultantsRepoProvider =
    Provider<IRecommendedConsultantRepository>(
  (ref) => RecommendedConsultantRepositoryImpl(
    ref.read(recommendedConsultantRemoteSourceProvider),
  ),
);

final streamConsultantStatusUseCaseProvider = Provider(
  (ref) =>
      StreamConsultantStatusUseCase(ref.read(onlineStatusRepositoryProvider)),
);

final getRecommendedConsultantsUseCaseProvider =
    Provider<GetRecommendedConsultantsUseCase>(
  (ref) => GetRecommendedConsultantsUseCase(
    ref.read(getRecommendedConsultantsRepoProvider),
  ),
);

/// 3. Use Case
final getTopConsultantsUseCaseProvider =
    Provider<GetTopRatedConsultantsUseCase>(
  (ref) => GetTopRatedConsultantsUseCase(
    ref.read(getRecommendedConsultantsRepoProvider),
  ),
);

final topConsultantListProvider = StateNotifierProvider<
    TopRateConsultantListNotifier,
    AsyncValue<List<RecommendedConsultantWithStatusEntity>>>(
  (ref) => TopRateConsultantListNotifier(
    ref.read(getTopConsultantsUseCaseProvider),
    ref.read(streamConsultantStatusUseCaseProvider),
  ),
);

final recommendedConsultantListProvider = StateNotifierProvider<
    RecommendedConsultantListNotifier,
    AsyncValue<List<RecommendedConsultantWithStatusEntity>>>(
  (ref) => RecommendedConsultantListNotifier(
    ref.read(getRecommendedConsultantsUseCaseProvider),
    ref.read(streamConsultantStatusUseCaseProvider),
  ),
);
