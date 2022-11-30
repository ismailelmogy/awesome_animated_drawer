import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../change_language/domain/usecases/change_lang.dart';
import '../../../change_language/domain/usecases/get_saved_lang.dart';
part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  String currentLangCode = AppStrings.englishCode;
  final GetSavedLang getSavedLangUseCase;
  final ChangeLang changeLangUseCase;
  LocaleBloc(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode))) {
    on<GetSavedLangEvent>(_getSavedLang);
    on<ChangeLangToEnglishEvent>(
      _changeLang,
    );
    on<ChangeLangToArabicEvent>(
      _changeLang,
    );
  }

  Future<void> _getSavedLang(
    GetSavedLangEvent event,
    Emitter<LocaleState> emit,
  ) async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(
    LocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    final response = await changeLangUseCase.call(event.langCode!);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = event.langCode!;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }
}
