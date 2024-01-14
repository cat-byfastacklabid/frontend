import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/avatar_appbar_widget.dart';
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
  final int timer;
  final Function()? onSubmit;

  const HorizontalQuestionBuilder({
    super.key,
    required this.questions,
    required this.questionLength,
    required this.currentQuestionIndex,
    this.onTapIndex,
    required this.mutateAnswer,
    required this.title,
    required this.timer,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [AvatarAppbarWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Sisa Waktu: $timer',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: QuestionBuilder(
                    currentQuestionIndex: currentQuestionIndex,
                    mutateAnswer: mutateAnswer,
                    onTapIndex: onTapIndex,
                    question: questions[currentQuestionIndex],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  flex: 2,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      QuestionIndex(
                        onTapIndex: onTapIndex,
                        currentIndex: currentQuestionIndex,
                        questionLength: questionLength,
                        questions: questions,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 70,
                        child: SubmitButton(onTap: onSubmit),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
