part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  final String? langCode;

  const LocaleEvent({this.langCode});

  @override
  List<Object> get props => [];
}

class GetSavedLangEvent extends LocaleEvent {}

class ChangeLangToEnglishEvent extends LocaleEvent {
  const ChangeLangToEnglishEvent({super.langCode = AppStrings.englishCode});
}

class ChangeLangToArabicEvent extends LocaleEvent {
  const ChangeLangToArabicEvent({super.langCode = AppStrings.arabicCode});
}
