import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.readPsikotestCubit.submit,
      child: const Text('Submit'),
    );
  }
}
