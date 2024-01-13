import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/option_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/option_button_widget.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/question_card_widget.dart';
import 'package:flutter/material.dart';

class ExampleQuestionBuilder extends StatefulWidget {
  final QuestionEntity question;
  final Function()? onTapDone;

  const ExampleQuestionBuilder({
    super.key,
    required this.question,
    this.onTapDone,
  });

  @override
  State<ExampleQuestionBuilder> createState() => _ExampleQuestionBuilderState();
}

class _ExampleQuestionBuilderState extends State<ExampleQuestionBuilder> {
  void onTapOption(int index) {
    for (var i = 0; i < widget.question.options.length; i++) {
      final option = widget.question.options[i];
      widget.question.options[i] = OptionEntity(
        id: option.id,
        name: option.name,
        value: option.value,
        isSelected: i == index ? true : false,
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuestionCardWidget(
              question: widget.question.question,
              width: context.verticalView
                  ? null
                  : MediaQuery.sizeOf(context).width * .3,
            ),
            ...List.generate(widget.question.options.length, (index) {
              final option = widget.question.options[index];
              return OptionButtonWidget(
                option: option,
                onTap: () => onTapOption(index),
              );
            }),
            ElevatedButton(
              onPressed: () {
                context.router.pop();
                widget.onTapDone?.call();
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
