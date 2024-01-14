import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final Function()? onTimerEnd;

  const TimerWidget({super.key, this.onTimerEnd});

  @override
  Widget build(BuildContext context) {
    if (context.watchPsikotestCubit.state.isExampleDone) {
      return TweenAnimationBuilder<Duration>(
        duration: const Duration(minutes: 60),
        tween: Tween(begin: const Duration(minutes: 60), end: Duration.zero),
        onEnd: onTimerEnd,
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Sisa Waktu: $minutes:$seconds',
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
