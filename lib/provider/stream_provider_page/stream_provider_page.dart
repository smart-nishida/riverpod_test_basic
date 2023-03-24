import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider((ref) {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return value++;
  });
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(streamProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Sample'),
      ),
      body: Center(
        child: value.when(
          data: (data) {
            return Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 24,
              ),
            );
          },
          error: (error, trace) => Text(
            error.toString(),
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
