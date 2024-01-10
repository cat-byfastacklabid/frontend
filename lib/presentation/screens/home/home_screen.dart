import 'package:auto_route/annotations.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenViewBuilder(
        verticalView: () => ListView.separated(
          shrinkWrap: true,
          itemCount: 100,
          itemBuilder: (context, index) => Center(child: Text('${index + 1}')),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
        horizontalView: () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          shrinkWrap: true,
          itemCount: 100,
          itemBuilder: (context, index) => Center(child: Text('${index + 1}')),
        ),
      ),
    );
  }
}
