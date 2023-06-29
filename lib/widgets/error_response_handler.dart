import 'package:eventapp/data/api/custom_exception.dart';
import 'package:eventapp/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';

class ErrorResponseHandler extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback? onError;
  final VoidCallback? retryCallback;

  const ErrorResponseHandler({
    super.key,
    this.onError,
    required this.retryCallback,
    required this.error,
    required this.stackTrace,
  });

  const factory ErrorResponseHandler.builder({
    Key? key,
    VoidCallback? onError,
    required Object error,
    required StackTrace? stackTrace,
    required Widget Function(CustomException) builder,
  }) = _ErrorResponseHandlerWithBuilder;

  @override
  Widget build(BuildContext context) {
    if (error is CustomException) {
      return CustomErrorWidget.light(
        error: error as CustomException,
        retryCallback: retryCallback!,
      );
    }
    onError?.call();
    debugPrint(error.toString());
    debugPrint(stackTrace?.toString());
    return const SizedBox.shrink();
  }
}

class _ErrorResponseHandlerWithBuilder extends ErrorResponseHandler {
  final Widget Function(CustomException) builder;

  const _ErrorResponseHandlerWithBuilder({
    super.key,
    super.onError,
    required super.error,
    required super.stackTrace,
    required this.builder,
  }) : super(
          retryCallback: null,
        );

  @override
  Widget build(BuildContext context) {
    if (error is CustomException) return builder(error as CustomException);
    onError?.call();
    debugPrint(error.toString());
    debugPrint(stackTrace?.toString());
    return const SizedBox.shrink();
  }
}
