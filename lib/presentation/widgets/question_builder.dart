import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:flutter/material.dart';

class QuestionBuilder extends StatelessWidget {
  final int currentQuestionIndex;
  final QuestionEntity question;
  final Function(int index)? onTapIndex;
  final Function(QuestionEntity question, String optionId) mutateAnswer;

  const QuestionBuilder({
    super.key,
    required this.currentQuestionIndex,
    required this.mutateAnswer,
    this.onTapIndex,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question.question),
        ...List.generate(
          question.options.length,
          (index) {
            final option = question.options[index];
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              color: option.isSelected ? Colors.green : null,
              child: InkWell(
                onTap: () {
                  onTapIndex?.call(currentQuestionIndex + 1);
                  mutateAnswer(question, option.id);
                },
                child: Text(option.name),
              ),
            );
          },
        ),
      ],
    );
  }
}
