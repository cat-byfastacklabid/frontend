import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:flutter/material.dart';

class ScreenViewBuilder extends StatelessWidget {
  final Widget Function() verticalView;
  final Widget Function() horizontalView;

  const ScreenViewBuilder({
    super.key,
    required this.horizontalView,
    required this.verticalView,
  });

  @override
  Widget build(BuildContext context) {
    if (context.verticalView) {
      return verticalView();
    }

    return horizontalView();
  }
}
