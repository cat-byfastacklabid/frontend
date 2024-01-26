import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/akademik/akademik_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/ketahanan/ketahanan_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final Function() onTap;
  final QuestionType questionType;
  const SubmitButton({
    super.key,
    required this.onTap,
    required this.questionType,
  });

  @override
  Widget build(BuildContext context) {
    if (questionType.isAkademik) {
      return AkademikSubmitButton(onTap: onTap);
    }
    if (questionType.isPsikotest) {
      return PsikotestSubmitButton(onTap: onTap);
    }

    return KetahananSubmitButton(onTap: onTap);
  }
}

class AkademikSubmitButton extends StatelessWidget {
  final Function() onTap;
  const AkademikSubmitButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AkademikCubit, AkademikState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onTap,
          child: state.answerResponseDataState.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Text('Submit'),
          ),
        );
      },
    );
  }
}

class KetahananSubmitButton extends StatelessWidget {
  final Function() onTap;
  const KetahananSubmitButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KetahananCubit, KetahananState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onTap,
          child: state.answerResponseDataState.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Text('Submit'),
          ),
        );
      },
    );
  }
}

class PsikotestSubmitButton extends StatelessWidget {
  final Function() onTap;
  const PsikotestSubmitButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PsikotestCubit, PsikotestState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onTap,
          child: state.answerResponseDataState.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Text('Submit'),
          ),
        );
      },
    );
  }
}
