import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/psikotest/get_psikotest_questions_use_case.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_akademik_kepolisian/state/view_state/view_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'psikotest_state.dart';
part 'psikotest_cubit.freezed.dart';

extension ScreenSizeCubitExt on BuildContext {
  PsikotestCubit get readPsikotestCubit => read<PsikotestCubit>();
}

@injectable
class PsikotestCubit extends Cubit<PsikotestState> {
  final GetPsikotestQuestionsUseCase getPsikotestQuestionsUseCase;

  PsikotestCubit(this.getPsikotestQuestionsUseCase)
      : super(PsikotestState.initial());

  void toQuestion(int index) {
    emit(state.copyWith(questionShowingIndex: index));
  }

  void getPsikotestQuestions() async {
    emit(state.copyWith(psikotestQustionsState: const ViewState.loading()));

    final result = await getPsikotestQuestionsUseCase.call(EmptyParams());

    result.when(
      success: (data) {
        final shuffledData = data.question.toList()..shuffle();
        emit(
          state.copyWith(
            psikotestQustionsState: const ViewState.success(),
            psikotestQustions: shuffledData,
          ),
        );
      },
      error: (message, errorCode) => emit(state.copyWith(
          psikotestQustionsState: ViewState.error(message, errorCode))),
    );
  }
}
