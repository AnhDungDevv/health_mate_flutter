import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownNotifier extends StateNotifier<int> {
  Timer? _timer;

  CountdownNotifier() : super(30);

  void startCountdown() {
    _timer?.cancel();
    state = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
      }
    });
  }

  void reset() {
    startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>((ref) {
  final notifier = CountdownNotifier();

  return notifier;
});
