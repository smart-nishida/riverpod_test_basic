import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final strProvider = Provider((ref) {
  return 'Hello Riverpod';
});

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(strProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Sample'),
      ),
      body: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
