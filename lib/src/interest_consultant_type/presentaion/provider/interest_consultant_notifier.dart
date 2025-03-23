import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/provider/interest_consultant_state.dart';

class InterestConsultantNotifier
    extends StateNotifier<InterestConsultantState> {
  InterestConsultantNotifier() : super(InterestConsultantState.initial());

  Future<void> fetchConsultantTypes() async {
    // try {
    //   state = state.copyWith(status: ConsultantStatus.loading);
    //   final response = await http.get(Uri.parse('https://api.example.com/consultant-types'));

    //   if (response.statusCode == 200) {
    //     final List<dynamic> jsonData = json.decode(response.body);
    //     final consultants = jsonData.map((e) => ConsultantTypeModel.fromJson(e)).toList();

    //     state = state.copyWith(
    //       status: ConsultantStatus.loaded,
    //       consultants: consultants,
    //     );
    //   } else {
    //     throw Exception('Lỗi server: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   state = state.copyWith(
    //     status: ConsultantStatus.error,
    //     errorMessage: e.toString(),
    //   );
    // }
  }
}
