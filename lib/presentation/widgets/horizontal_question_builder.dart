import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:flutter/material.dart';

class HorizontalQuestionBuilder extends StatelessWidget {
  final int questionLength;
  final int currentQuestionIndex;
  final QuestionEntity question;
  final Function(int index) onTapIndex;
  final Function(QuestionEntity question, String optionId) mutateAnswer;

  const HorizontalQuestionBuilder({
    super.key,
    required this.question,
    required this.questionLength,
    required this.currentQuestionIndex,
    required this.onTapIndex,
    required this.mutateAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(question.question),
              ...List.generate(
                question.options.length,
                (index) {
                  final answer = question.options[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    color: answer.isSelected ? Colors.green : null,
                    child: InkWell(
                      onTap: () {
                        onTapIndex(currentQuestionIndex + 1);
                        mutateAnswer(question, answer.id);
                      },
                      child: Text(answer.name),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: questionLength,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onTapIndex(index),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  color: index == currentQuestionIndex ? Colors.green : null,
                  child: Text('${index + 1}'),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
