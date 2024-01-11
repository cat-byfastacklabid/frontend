import 'package:auto_route/annotations.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/horizontal_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/vertical_question_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<PsikotestCubit>()..getPsikotestQuestions(),
      child: Scaffold(
        body: BlocBuilder<PsikotestCubit, PsikotestState>(
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
                ),
                horizontalView: () => HorizontalQuestionBuilder(
                  questions: state.psikotestQustions,
                  questionLength: state.psikotestQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readPsikotestCubit.toQuestion,
                  mutateAnswer: context.readPsikotestCubit.mutateAnswer,
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
