import 'package:health_mate/src/interest_consultant_type/domain/entities/consultant_type_entity.dart';

enum InterestConsultantStatus { initial, loading, loaded, error }

class InterestConsultantState {
  final InterestConsultantStatus status;
  final List<ConsultantTypeEntity> consultantsType;
  final String? errorMessage;

  InterestConsultantState({
    required this.status,
    required this.consultantsType,
    this.errorMessage,
  });

  factory InterestConsultantState.initial() {
    return InterestConsultantState(
      status: InterestConsultantStatus.initial,
      consultantsType: [],
    );
  }

  InterestConsultantState copyWith({
    InterestConsultantStatus? status,
    List<ConsultantTypeEntity>? consultantsType,
    String? errorMessage,
  }) {
    return InterestConsultantState(
      status: status ?? this.status,
      consultantsType: consultantsType ?? this.consultantsType,
      errorMessage: errorMessage,
    );
  }
}
