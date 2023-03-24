import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/provider_page/provider_page.dart';
import 'provider/state_notifier_provider_page/state_notifier_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navigatorPushButton(context, const ProviderPage(), 'ProviderPage'),
            navigatorPushButton(context, const StateNotifierProviderPage(), 'StateNotifierProviderPage'),
          ],
        ),
      ),
    );
  }

  Widget navigatorPushButton(BuildContext context, Widget page, String pageName) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page));
      },
      child: Text(pageName),
    );
  }
}
