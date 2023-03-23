import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_notifier.dart';

final countNotifierProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, int>((ref) {
  return CounterNotifier();
});