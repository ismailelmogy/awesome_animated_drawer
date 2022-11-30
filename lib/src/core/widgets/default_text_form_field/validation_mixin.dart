import 'package:flutter/material.dart';
import '../../../config/locale/app_localizations.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String? validateUserNameOrEmail(String? userNameOrEmail) {
    if (userNameOrEmail!.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .translate('user_name_or_email_validation');
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.trim().isEmpty) {
      return AppLocalizations.of(context)!.translate('password_validation');
    }
    return null;
  }
}
