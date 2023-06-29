import 'package:eventapp/data/api/custom_exception.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final CustomException error;
  final Color backgroundColor;
  final double height;
  final VoidCallback retryCallback;

  const CustomErrorWidget._({
    required this.error,
    required this.backgroundColor,
    required this.retryCallback,
    required this.height,
  });

  const factory CustomErrorWidget.dark({
    required CustomException error,
    required VoidCallback retryCallback,
    double? height,
  }) = _CustomErrorWidgetDark;

  const factory CustomErrorWidget.light({
    required CustomException error,
    required VoidCallback retryCallback,
    double? height,
  }) = _CustomErrorWidgetLight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        height: height,
        padding: const EdgeInsets.fromLTRB(30, 25, 30, 35),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Oops',
              ),
              Text(
                error.message,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              FilledButton(
                onPressed: retryCallback,
                child: const Center(
                  child: Text(
                    'RETRY',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomErrorWidgetDark extends CustomErrorWidget {
  const _CustomErrorWidgetDark({
    required super.error,
    required super.retryCallback,
    double? height,
  }) : super._(
          backgroundColor: const Color(0x55555545),
          height: height ?? double.infinity,
        );
}

class _CustomErrorWidgetLight extends CustomErrorWidget {
  const _CustomErrorWidgetLight({
    required super.error,
    required super.retryCallback,
    double? height,
  }) : super._(
          backgroundColor: const Color(0x55555545),
          height: height ?? double.infinity,
        );
}
