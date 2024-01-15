import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  final AnswerResponseDataEntity response;

  const ResultScreen({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat ${response.username}! Anda telah menyelesaikan test dengan skor',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: context.verticalView ? 24 : 34,
              ),
            ),
            Text(
              response.value,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: context.verticalView ? 34 : 44,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                context.router.pushAndPopUntil(const LoginRoute(),
                    predicate: (route) => route.isActive);
              },
              child: const Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}
