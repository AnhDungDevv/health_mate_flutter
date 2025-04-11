import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/doamin/entity/recommended_consultant_with_status_entity.dart';
import 'package:health_mate/src/home/doamin/usecase/get_recommended_consultants_usecase.dart';
import 'package:health_mate/src/home/doamin/usecase/stream_consultant_status_usecase.dart';

class RecommendedConsultantListNotifier extends StateNotifier<
    AsyncValue<List<RecommendedConsultantWithStatusEntity>>> {
  RecommendedConsultantListNotifier(
    this._getRecommendedUseCase,
    this._streamStatusUseCase,
  ) : super(const AsyncLoading()) {
    _init();
  }

  final GetRecommendedConsultantsUseCase _getRecommendedUseCase;
  final StreamConsultantStatusUseCase _streamStatusUseCase;

  void _init() async {
    try {
      final consultants = await _getRecommendedUseCase();
      final mapped = consultants
          .map((e) => RecommendedConsultantWithStatusEntity(
              consultant: e, isOnline: false))
          .toList();

      state = AsyncData(mapped);

      // _streamStatusUseCase().listen((event) {
      //   final userId = event.keys.first;
      //   final isOnline = event[userId]!;

      //   state = state.whenData((data) {
      //     return data
      //         .map((item) => item.consultant.id == userId
      //             ? item.copyWith(isOnline: isOnline)
      //             : item)
      //         .toList();
      //   });
      // });
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
