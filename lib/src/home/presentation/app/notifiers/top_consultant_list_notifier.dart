import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/doamin/entity/recommended_consultant_with_status_entity.dart';
import 'package:health_mate/src/home/doamin/usecase/get_top_rated_consultants_usecase.dart';
import 'package:health_mate/src/home/doamin/usecase/stream_consultant_status_usecase.dart';

class TopRateConsultantListNotifier extends StateNotifier<
    AsyncValue<List<RecommendedConsultantWithStatusEntity>>> {
  final GetTopRatedConsultantsUseCase _getTopRatedConsultantsUseCase;
  final StreamConsultantStatusUseCase _streamStatusUseCase;
  TopRateConsultantListNotifier(
      this._getTopRatedConsultantsUseCase, this._streamStatusUseCase)
      : super(const AsyncLoading()) {
    _init();
  }
  void _init() async {
    try {
      final consutlantTops = await _getTopRatedConsultantsUseCase();
      final mapped = consutlantTops
          .map((e) => RecommendedConsultantWithStatusEntity(
              consultant: e, isOnline: false))
          .toList();

      state = AsyncData(mapped);
      print("state : $state");
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
