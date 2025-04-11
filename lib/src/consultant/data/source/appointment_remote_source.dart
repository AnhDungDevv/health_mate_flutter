import 'package:health_mate/src/consultant/data/model/appointment_model.dart';

class AppointmentRemoteSource {
  Future<List<AppointmentModel>> fetchAppointments() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const AppointmentModel(
        id: '1',
        name: 'Dr. John Smith',
        specialization: 'Clinical Psychologist',
        dateTime: 'Monday, 16 Aug 2023 | 13:45 PM',
        duration: '15 mins',
        imageUrl: 'assets/images/user_consultant/1.png',
        isVideo: false,
      ),
      const AppointmentModel(
        id: '2',
        name: 'Dr. Jane Doe',
        specialization: 'Clinical Psychologist',
        dateTime: 'Tuesday, 17 Aug 2023 | 14:00 PM',
        duration: '5 mins',
        imageUrl: 'assets/images/user_consultant/2.png',
        isVideo: true,
      ),
    ];
  }
}
