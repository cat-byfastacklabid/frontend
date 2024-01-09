import 'package:cat_akademik_kepolisian/domain/entities/screen_size/screen_size_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'screen_size_state.dart';
part 'screen_size_cubit.freezed.dart';

extension ScreenSizeCubitExt on BuildContext {
  ScreenSizeCubit get readScreenSizeCubit => read<ScreenSizeCubit>();
  ScreenSizeCubit get watchScreenSizeCubit => watch<ScreenSizeCubit>();

  ScreenSizeEntity get screenSize => watchScreenSizeCubit.state.screenSize;
}

@injectable
class ScreenSizeCubit extends Cubit<ScreenSizeState> {
  ScreenSizeCubit() : super(ScreenSizeState.initial());

  void registerSize(ScreenSizeEntity screenSize) =>
      emit(state.copyWith(screenSize: screenSize));
}
