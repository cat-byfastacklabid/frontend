import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_index.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class HorizontalQuestionBuilder extends StatelessWidget {
  final int questionLength;
  final int currentQuestionIndex;
  final List<QuestionEntity> questions;
  final Function(int index)? onTapIndex;
  final Function(QuestionEntity question, String optionId) mutateAnswer;
  final String title;

  const HorizontalQuestionBuilder({
    super.key,
    required this.questions,
    required this.questionLength,
    required this.currentQuestionIndex,
    this.onTapIndex,
    required this.mutateAnswer,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: QuestionBuilder(
                currentQuestionIndex: currentQuestionIndex,
                mutateAnswer: mutateAnswer,
                onTapIndex: onTapIndex,
                question: questions[currentQuestionIndex],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuestionIndex(
                    onTapIndex: onTapIndex,
                    currentIndex: currentQuestionIndex,
                    questionLength: questionLength,
                    questions: questions,
                  ),
                  const SubmitButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
