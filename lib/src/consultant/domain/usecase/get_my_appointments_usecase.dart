import 'package:health_mate/src/consultant/domain/repository/appointment_repository.dart';

import '../../domain/entities/appointment_entity.dart';

class GetMyAppointmentsUseCase {
  final AppointmentRepository repository;

  GetMyAppointmentsUseCase(this.repository);

  Future<List<AppointmentEntity>> call() => repository.getMyAppointments();
}
