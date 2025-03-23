import 'package:health_mate/src/interest_consultant_type/data/model/interest_consultant_type_model.dart';

enum InterestConsultantStatus { initial, loading, loaded, error }

class InterestConsultantState {
  final InterestConsultantStatus status;
  final List<ConsultantTypeModel> consultants;
  final String? errorMessage;

  InterestConsultantState({
    required this.status,
    required this.consultants,
    this.errorMessage,
  });

  factory InterestConsultantState.initial() {
    return InterestConsultantState(
      status: InterestConsultantStatus.initial,
      consultants: [],
    );
  }

  InterestConsultantState copyWith({
    InterestConsultantStatus? status,
    List<ConsultantTypeModel>? consultants,
    String? errorMessage,
  }) {
    return InterestConsultantState(
      status: status ?? this.status,
      consultants: consultants ?? this.consultants,
      errorMessage: errorMessage,
    );
  }
}
