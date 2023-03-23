import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state_notifier_provider_page_next.dart';
import 'state_notifier_provider.dart';

// final countNotifierProvider =
//     StateNotifierProvider.autoDispose<CounterNotifier, int>((ref) {
//   return CounterNotifier();
// });

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countStateController = ref.read(countNotifierProvider.notifier);
    final count = ref.watch(countNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 24),
            ),
            navigatorPushButton(context, const StateNotifierProviderPageNext(),
                'StateNotifierProviderPageNext'),
          ],
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

  Widget navigatorPushButton(
      BuildContext context, Widget page, String pageName) {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Text(pageName),
    );
  }
}
