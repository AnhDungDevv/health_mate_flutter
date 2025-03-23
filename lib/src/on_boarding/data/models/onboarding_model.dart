import '../../domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  OnboardingModel({
    required super.id,
    required super.image,
    required List<OnboardingContentModel> super.contents,
  });

  /// Convert from JSON to Model
  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      contents: (json['contents'] as List<dynamic>?)
              ?.map((item) => OnboardingContentModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  /// Convert from Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'contents': contents
          .map((item) => (item as OnboardingContentModel).toJson())
          .toList(),
    };
  }

  /// Convert Model to Entity
  OnboardingEntity toEntity() {
    return OnboardingEntity(
      id: id,
      image: image,
      contents: contents
          .map((item) => (item as OnboardingContentModel).toEntity())
          .toList(),
    );
  }

  /// Convert Entity to Model
  factory OnboardingModel.fromEntity(OnboardingEntity entity) {
    return OnboardingModel(
      id: entity.id,
      image: entity.image,
      contents: entity.contents
          .map((e) => OnboardingContentModel.fromEntity(e))
          .toList(),
    );
  }
}

// OnboardingContentModel
class OnboardingContentModel extends OnboardingContentEntity {
  OnboardingContentModel({
    required super.id,
    required super.title,
    required super.description,
  });

  /// Convert from JSON to Model
  factory OnboardingContentModel.fromJson(Map<String, dynamic> json) {
    return OnboardingContentModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  /// Convert from Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  /// Convert Model to Entity
  OnboardingContentEntity toEntity() {
    return OnboardingContentEntity(
        id: id, title: title, description: description);
  }

  /// Convert Entity to Model
  factory OnboardingContentModel.fromEntity(OnboardingContentEntity entity) {
    return OnboardingContentModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
    );
  }
}
