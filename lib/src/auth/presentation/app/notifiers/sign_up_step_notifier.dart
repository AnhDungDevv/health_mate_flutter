import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

class SignUpStepNotifier extends StateNotifier<int> {
  SignUpStepNotifier({required this.ref}) : super(1);
  final Ref ref;
  Role get role => ref.read(signUpProvider).data.role;
  List<String> get steps {
    if (role == Role.consultant) {
      return [
        "1/3 - Choose Category",
        "2/3 - Personal Information",
        "3/3 - Professional Details"
      ];
    } else {
      return ["1/2", "2/2", "Skip"];
    }
  }

  void nextStep() {
    if (state < steps.length) state += 1;
  }

  void previousStep() {
    if (state > 1) state -= 1;
  }

  void reset() {
    state = 1;
    ref.read(signUpProvider.notifier).resetData();
  }
}
