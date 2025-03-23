import 'package:flutter_riverpod/flutter_riverpod.dart';

final debounceInputProvider =
    StateProvider.family<void, String>((ref, field) => {});
