import 'package:auto_route/annotations.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.screenSize.maxWidth < 600
          ? ListView.separated(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) =>
                  Center(child: Text('${index + 1}')),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) =>
                  Center(child: Text('${index + 1}')),
            ),
    );
  }
}
