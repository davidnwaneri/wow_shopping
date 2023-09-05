import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Loads the app
void bootstrap(Widget Function() builder) {
  runApp(
    ProviderScope(
      observers: [
        AppProviderObserver(),
      ],
      child: builder(),
    ),
  );
}

class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(provider, previousValue, newValue, container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    // debugPrint(
    //   '''didUpdateProvider: ${provider.name ?? provider.runtimeType}'''
    //   '''\npreviousValue: $previousValue'''
    //   '''\nnewValue: $newValue'''
    // );
  }
}
