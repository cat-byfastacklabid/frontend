import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_index.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class VerticalQuestionBuilder extends StatelessWidget {
  final int questionLength;
  final int currentQuestionIndex;
  final List<QuestionEntity> questions;
  final Function(int index)? onTapIndex;
  final Function(QuestionEntity question, String optionId) mutateAnswer;

  const VerticalQuestionBuilder({
    super.key,
    required this.questions,
    required this.questionLength,
    required this.currentQuestionIndex,
    this.onTapIndex,
    required this.mutateAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        QuestionBuilder(
          currentQuestionIndex: currentQuestionIndex,
          mutateAnswer: mutateAnswer,
          onTapIndex: onTapIndex,
          question: questions[currentQuestionIndex],
        ),
        QuestionIndex(
          onTapIndex: onTapIndex,
          currentIndex: currentQuestionIndex,
          questionLength: questionLength,
          questions: questions,
        ),
        const SubmitButton(),
      ],
    );
  }
}
