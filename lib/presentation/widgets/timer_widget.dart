import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/akademik/akademik_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/ketahanan/ketahanan_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final Function()? onTimerEnd;
  final QuestionType questionType;

  const TimerWidget({
    super.key,
    this.onTimerEnd,
    required this.questionType,
  });

  bool isExampleDone(BuildContext context) {
    if (questionType.isAkademik) {
      return context.watchAkademikCubit.state.isExampleDone;
    }
    if (questionType.isPsikotest) {
      return context.watchPsikotestCubit.state.isExampleDone;
    }

    return context.watchKetahananCubit.state.isExampleDone;
  }

  @override
  Widget build(BuildContext context) {
    if (isExampleDone(context)) {
      return TweenAnimationBuilder<Duration>(
        duration: const Duration(minutes: 60),
        tween: Tween(begin: const Duration(minutes: 60), end: Duration.zero),
        onEnd: onTimerEnd,
        builder: (context, value, child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Sisa Waktu: $minutes:${seconds.toString().length == 1 ? '0$seconds' : seconds}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}
