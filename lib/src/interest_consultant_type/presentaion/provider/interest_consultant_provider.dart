import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:health_mate/src/interest_consultant_type/presentaion/provider/interest_consultant_notifier.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/provider/interest_consultant_state.dart';

final interestConsultantProvider =
    StateNotifierProvider<InterestConsultantNotifier, InterestConsultantState>(
  (ref) => InterestConsultantNotifier(),
);
