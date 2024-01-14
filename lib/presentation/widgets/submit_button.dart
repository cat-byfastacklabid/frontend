import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final Function()? onTap;
  const SubmitButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PsikotestCubit, PsikotestState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.readPsikotestCubit.submit();
            onTap?.call();
          },
          child: state.answerResponseDataState.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Text('Submit'),
          ),
        );
      },
    );
  }
}
