// theme_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light())) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.themeData == ThemeData.light()) {
        emit(ThemeState(themeData: ThemeData.dark()));
      } else {
        emit(ThemeState(themeData: ThemeData.light()));
      }
    });
  }
}
