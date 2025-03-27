import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/utils/shared_prefs.dart';
import 'package:health_mate/src/interest_consultant_type/domain/usecase/post_selected_interests.dart';

class SelectedInterestsNotifier extends StateNotifier<List<String>> {
  final PostSelectedInterestsUseCase _interestsUseCase;
  SelectedInterestsNotifier(this._interestsUseCase) : super([]);

  bool isSelected(String interestID) => state.contains(interestID);

  void toggleInterest(String interestID) {
    if (state.contains(interestID)) {
      state = state.where((item) => item != interestID).toList();
    } else {
      state = [...state, interestID];
    }
  }

  Future<void> submitInterests() async {
    final userId = await SharedPrefsHelper.getString('user_id');
    await _interestsUseCase(userId!, state);
  }
}
