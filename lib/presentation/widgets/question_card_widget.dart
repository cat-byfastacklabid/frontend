import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:flutter/material.dart';

class QuestionCardWidget extends StatelessWidget {
  final String question;
  final double? width;

  const QuestionCardWidget({super.key, required this.question, this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .3,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(context.verticalView ? 8.0 : 12.0),
          child: Center(
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.verticalView ? 18 : 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}