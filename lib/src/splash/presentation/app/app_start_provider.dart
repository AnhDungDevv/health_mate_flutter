import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/presentaion/app/provider/chat_provider.dart';

final appStartProvider = Provider<void>((ref) {
  ref.read(chatWsSourceProvider);
});
