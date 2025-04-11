import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/data/repository/appointment_repository_impl.dart';
import 'package:health_mate/src/consultant/data/source/appointment_remote_source.dart';
import 'package:health_mate/src/consultant/domain/entities/appointment_entity.dart';
import 'package:health_mate/src/consultant/domain/repository/appointment_repository.dart';
import 'package:health_mate/src/consultant/domain/usecase/get_my_appointments_usecase.dart';
import 'package:health_mate/src/consultant/presentaion/app/notifier/my_consultation_notifier.dart';

final appointmentRemoteSourceProvider =
    Provider((ref) => AppointmentRemoteSource());

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepositoryImpl(ref.watch(appointmentRemoteSourceProvider));
});

final getMyAppointmentsUseCaseProvider = Provider((ref) {
  return GetMyAppointmentsUseCase(ref.watch(appointmentRepositoryProvider));
});

final myConsultationNotifierProvider = StateNotifierProvider<
    MyConsultationNotifier, AsyncValue<List<AppointmentEntity>>>((ref) {
  return MyConsultationNotifier(ref.watch(getMyAppointmentsUseCaseProvider));
});
