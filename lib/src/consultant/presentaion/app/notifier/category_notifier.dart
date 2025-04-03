import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/domain/usecase/get_category.dart';
import 'package:health_mate/src/consultant/presentaion/app/state/category_state.dart';

class InterestConsultantNotifier
    extends StateNotifier<InterestConsultantState> {
  final GetInterestConsultantsUseCase _getInterestConsultantsUseCase;
  InterestConsultantNotifier(this._getInterestConsultantsUseCase)
      : super(InterestConsultantState.initial());

  Future<void> fetchConsultantTypes() async {
    final result = await _getInterestConsultantsUseCase();
    result.fold(
      (failure) {
        state = state.copyWith(
          status: InterestConsultantStatus.error,
          errorMessage: failure.message,
        );
      },
      (consultantTypes) {
        state = state.copyWith(
          status: InterestConsultantStatus.loaded,
          consultantsType: consultantTypes,
          errorMessage: null,
        );
      },
    );
  }
}
