class OnboardingEntity {
  final String id;
  final String image;
  final List<OnboardingContentEntity> contents;

  const OnboardingEntity({
    required this.id,
    required this.image,
    required this.contents,
  });
}

class OnboardingContentEntity {
  final String id;
  final String title;
  final String description;

  const OnboardingContentEntity({
    required this.id,
    required this.title,
    required this.description,
  });
}
