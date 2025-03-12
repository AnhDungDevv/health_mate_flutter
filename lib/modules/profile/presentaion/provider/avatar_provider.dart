import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/profile/presentaion/provider/avatar_notifier.dart';

final avatarProvider = StateNotifierProvider<AvatarNotifier, File?>((ref) {
  return AvatarNotifier();
});
