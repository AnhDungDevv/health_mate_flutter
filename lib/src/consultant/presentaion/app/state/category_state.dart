import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';

enum InterestConsultantStatus { initial, loading, loaded, error }

class InterestConsultantState {
  final InterestConsultantStatus status;
  final List<CategoryEntity> consultantsType;
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
    List<CategoryEntity>? consultantsType,
    String? errorMessage,
  }) {
    return InterestConsultantState(
      status: status ?? this.status,
      consultantsType: consultantsType ?? this.consultantsType,
      errorMessage: errorMessage,
    );
  }
}
