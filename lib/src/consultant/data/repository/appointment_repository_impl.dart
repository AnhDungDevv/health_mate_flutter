import 'package:health_mate/src/consultant/data/model/appointment_model.dart';
import 'package:health_mate/src/consultant/data/source/appointment_remote_source.dart';
import 'package:health_mate/src/consultant/domain/repository/appointment_repository.dart';

import '../../domain/entities/appointment_entity.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteSource remoteSource;

  AppointmentRepositoryImpl(this.remoteSource);

  @override
  Future<List<AppointmentEntity>> getMyAppointments() async {
    final models = await remoteSource.fetchAppointments();
    return models.map((e) => e.toEntity()).toList();
  }
}
