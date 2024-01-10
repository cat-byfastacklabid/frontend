import 'package:cat_akademik_kepolisian/domain/use_cases/psikotest/get_psikotest_questions_use_case.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/psikotest/psikotest_entity.dart';
import 'package:cat_akademik_kepolisian/state/view_state/view_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'psikotest_state.dart';
part 'psikotest_cubit.freezed.dart';

@injectable
class PsikotestCubit extends Cubit<PsikotestState> {
  final GetPsikotestQuestionsUseCase getPsikotestQuestionsUseCase;

  PsikotestCubit(this.getPsikotestQuestionsUseCase)
      : super(PsikotestState.initial());

  void getPsikotestQuestions() async {
    emit(state.copyWith(psikotestQustionsState: const ViewState.loading()));

    final result = await getPsikotestQuestionsUseCase.call(EmptyParams());

    result.when(
      success: (data) => emit(state.copyWith(
          psikotestQustionsState: const ViewState.success(),
          psikotestQustions: data)),
      error: (message, errorCode) => emit(state.copyWith(
          psikotestQustionsState: ViewState.error(message, errorCode))),
    );
  }
}
