import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/example_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/horizontal_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/vertical_question_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PsikotestScreen extends StatefulWidget {
  const PsikotestScreen({super.key});

  @override
  State<PsikotestScreen> createState() => _PsikotestScreenState();
}

class _PsikotestScreenState extends State<PsikotestScreen> {
  int timeInSec = 60;
  Timer? _timer;

  void startTimer() {
    // const oneSec = Duration(seconds: 1);
    // _timer = Timer.periodic(
    //   oneSec,
    //   (Timer timer) {
    //     if (timeInSec == 0) {
    //       setState(() {
    //         timer.cancel();
    //       });
    //     } else {
    //       setState(() {
    //         timeInSec--;
    //       });
    //     }
    //   },
    // );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 60)).then((_) {
      context.readPsikotestCubit.submit();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<PsikotestCubit>()..getPsikotestQuestions(),
      child: Scaffold(
        body: BlocConsumer<PsikotestCubit, PsikotestState>(
          listener: (context, state) {
            state.psikotestQustionsState.maybeWhen(
              success: () {
                if (!state.isExampleDone) {
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dContext) => ExampleQuestionBuilder(
                      question: state.exampleTest,
                      onTapDone: () {
                        context.readPsikotestCubit.finishExample();
                        startTimer();
                      },
                    ),
                  );
                }
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
          builder: (context, state) {
            return state.psikotestQustionsState.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => ScreenViewBuilder(
                verticalView: () => VerticalQuestionBuilder(
                  questions: state.psikotestQustions,
                  questionLength: state.psikotestQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readPsikotestCubit.toQuestion,
                  mutateAnswer: context.readPsikotestCubit.mutateAnswer,
                  title: state.title,
                  timer: timeInSec,
                  onSubmit: () =>
                      (_timer?.isActive ?? false) ? _timer?.cancel() : null,
                ),
                horizontalView: () => HorizontalQuestionBuilder(
                  questions: state.psikotestQustions,
                  questionLength: state.psikotestQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readPsikotestCubit.toQuestion,
                  mutateAnswer: context.readPsikotestCubit.mutateAnswer,
                  title: state.title,
                  timer: timeInSec,
                  onSubmit: () =>
                      (_timer?.isActive ?? false) ? _timer?.cancel() : null,
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
