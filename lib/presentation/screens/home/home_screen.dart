import 'package:auto_route/annotations.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
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
                verticalView: () => ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.psikotestQustions.length,
                  itemBuilder: (context, index) {
                    final question = state.psikotestQustions[index];
                    return Column(
                      children: [
                        Text(question.questions),
                        ...List.generate(question.answerOptions.length,
                            (index) {
                          final answer = question.answerOptions[index];
                          return Text(answer.answer);
                        })
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
                horizontalView: () => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  itemCount: state.psikotestQustions.length,
                  itemBuilder: (context, index) {
                    final question = state.psikotestQustions[index];
                    return Column(
                      children: [
                        Text(question.questions),
                        ...List.generate(question.answerOptions.length,
                            (index) {
                          final answer = question.answerOptions[index];
                          return Text(answer.answer);
                        })
                      ],
                    );
                  },
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
