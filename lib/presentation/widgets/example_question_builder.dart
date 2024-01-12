import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/option_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
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
      content: Column(
        children: [
          Text(widget.question.question),
          ...List.generate(widget.question.options.length, (index) {
            final option = widget.question.options[index];
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              color: option.isSelected ? Colors.green : null,
              child: InkWell(
                onTap: () => onTapOption(index),
                child: Text(option.name),
              ),
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
    );
  }
}
