import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/option_button_widget.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_card_widget.dart';
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
        QuestionCardWidget(
            question: '${currentQuestionIndex + 1}. ${question.question}'),
        const SizedBox(height: 12),
        ...List.generate(
          question.options.length,
          (index) {
            final option = question.options[index];
            return OptionButtonWidget(
              option: option,
              onTap: () {
                onTapIndex?.call(currentQuestionIndex + 1);
                mutateAnswer(question, option.id);
              },
            );
          },
        ),
      ],
    );
  }
}
