import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/domain/usecase/get_category.dart';
import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';

class InterestConsultantNotifier
    extends StateNotifier<AsyncValue<List<CategoryEntity>>> {
  final GetInterestConsultantsUseCase _getInterestConsultantsUseCase;

  InterestConsultantNotifier(this._getInterestConsultantsUseCase)
      : super(const AsyncValue.loading()) {
    fetchConsultantTypes();
  }
  Future<void> fetchConsultantTypes() async {
    state = const AsyncValue.loading();

    try {
      final result = await _getInterestConsultantsUseCase();

      result.fold(
        (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
        (consultants) {
          state = AsyncValue.data(consultants);
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
