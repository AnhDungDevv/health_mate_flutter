import 'package:health_mate/src/consultant/domain/entities/appointment_entity.dart';

abstract class AppointmentRepository {
  Future<List<AppointmentEntity>> getMyAppointments();
}
