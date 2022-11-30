import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/app_strings.dart';
import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  static AppLocalizations get instance => AppLocalizationsDelegate.instance;

  late Map<String, String> _localizedStrings;

  Future<void> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? translate(String key) => _localizedStrings[key];

  bool get isEnLocale => locale.languageCode == AppStrings.englishCode;
}
