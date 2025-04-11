class AppointmentEntity {
  final String id;
  final String name;
  final String specialization;
  final String dateTime;
  final String duration;
  final String imageUrl;
  final bool isVideo;

  AppointmentEntity({
    required this.id,
    required this.name,
    required this.specialization,
    required this.dateTime,
    required this.duration,
    required this.imageUrl,
    required this.isVideo,
  });
}
