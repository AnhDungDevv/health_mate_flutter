import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/domain/entities/appointment_entity.dart';
import 'package:health_mate/src/consultant/domain/usecase/get_my_appointments_usecase.dart';

class MyConsultationNotifier
    extends StateNotifier<AsyncValue<List<AppointmentEntity>>> {
  final GetMyAppointmentsUseCase useCase;

  MyConsultationNotifier(this.useCase) : super(const AsyncValue.loading()) {
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    try {
      final appointments = await useCase();
      state = AsyncValue.data(appointments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
