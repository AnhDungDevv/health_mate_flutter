// 3. Optimized Countdown Notifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class CountdownNotifier extends StateNotifier<int> {
  CountdownNotifier() : super(30) {
    _startTimer();
  }

  Timer? _timer;

  bool get canResend => state == 0;

  void _startTimer() {
    _timer?.cancel();
    state = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) state--;
      if (state == 0) timer.cancel();
    });
  }

  void reset() => _startTimer();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>(
  (ref) => CountdownNotifier(),
);
