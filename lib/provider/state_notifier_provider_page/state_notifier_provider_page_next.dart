import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state_notifier_provider.dart';

// final countNotifierProvider =
//     StateNotifierProvider<CounterNotifier, int>((ref) {
//   return CounterNotifier();
// });

class StateNotifierProviderPageNext extends ConsumerWidget {
  const StateNotifierProviderPageNext({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countStateController = ref.read(countNotifierProvider.notifier);
    final count = ref.watch(countNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider Sample Next'),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countStateController.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
