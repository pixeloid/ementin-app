import 'package:eventapp/features/event/application/event_provider.dart';
import 'package:eventapp/features/event/pages/event_list_page.dart';
import 'package:eventapp/widgets/error_response_handler.dart';
import 'package:eventapp/widgets/lottie_animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _cacheLoaderFutureProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    await Future.wait([
      ref.watch(eventListProvider.notifier).getEvents(),
    ]);
  },
);

class AppStartupScreen extends ConsumerWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheLoaderFuture = ref.watch(_cacheLoaderFutureProvider);
    return cacheLoaderFuture.when(
      data: (_) => const EventListPage(),
      loading: () => const LottieAnimationLoader(),
      error: (error, st) => Scaffold(
        body: ErrorResponseHandler(
          error: error,
          retryCallback: () => ref.refresh(_cacheLoaderFutureProvider),
          stackTrace: st,
        ),
      ),
    );
  }
}
