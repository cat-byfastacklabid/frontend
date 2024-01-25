import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/avatar_appbar_widget.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_index.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/submit_button.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/timer_widget.dart';
import 'package:flutter/material.dart';

class VerticalQuestionBuilder extends StatelessWidget {
  final int questionLength;
  final int currentQuestionIndex;
  final List<QuestionEntity> questions;
  final Function(int index)? onTapIndex;
  final Function(QuestionEntity question, String optionId) mutateAnswer;
  final String title;
  final Function() onTimerEnd;

  const VerticalQuestionBuilder({
    super.key,
    required this.questions,
    required this.questionLength,
    required this.currentQuestionIndex,
    this.onTapIndex,
    required this.mutateAnswer,
    required this.title,
    required this.onTimerEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [AvatarAppbarWidget()],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Nomor Soal',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              QuestionIndex(
                onTapIndex: onTapIndex,
                currentIndex: currentQuestionIndex,
                questionLength: questionLength,
                questions: questions,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TimerWidget(onTimerEnd: onTimerEnd),
            QuestionBuilder(
              currentQuestionIndex: currentQuestionIndex,
              mutateAnswer: mutateAnswer,
              onTapIndex: onTapIndex,
              question: questions[currentQuestionIndex],
            ),
            const SizedBox(height: 16),
            const SubmitButton(),
          ],
        ),
      ),
    );
  }
}
