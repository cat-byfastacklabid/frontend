import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuestionSelectionScreen extends StatelessWidget {
  const QuestionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 150,
                width: 150,
                child: Card(
                  child: Center(child: Text('TPA')),
                ),
              ),
            ),
            InkWell(
              onTap: () => context.router.push(const PsikotestRoute()),
              child: const SizedBox(
                height: 150,
                width: 150,
                child: Card(
                  child: Center(child: Text('Psikotest')),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 150,
                width: 150,
                child: Card(
                  child: Center(child: Text('Kepribadian')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}