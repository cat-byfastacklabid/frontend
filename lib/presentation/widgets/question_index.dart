import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  final int questionLength;
  final int currentIndex;
  final Function(int index)? onTapIndex;
  final List<QuestionEntity> questions;

  const QuestionIndex({
    super.key,
    required this.currentIndex,
    required this.questionLength,
    this.onTapIndex,
    required this.questions,
  });

  bool isAnswered(int index) {
    var values =
        questions[index].options.map((element) => element.isSelected).toSet();
    return values.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        questionLength,
        (index) {
          return InkWell(
            onTap: () => onTapIndex?.call(index),
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              color: currentIndex == index
                  ? Colors.grey.shade400
                  : isAnswered(index)
                      ? Colors.green
                      : null,
              child: Center(child: Text('${index + 1}')),
            ),
          );
        },
      ),
    );
  }
}
