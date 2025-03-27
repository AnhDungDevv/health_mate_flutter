import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/interest_consultant_type/domain/usecase/get_interest_consultants.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/app/state/interest_consultant_state.dart';

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
