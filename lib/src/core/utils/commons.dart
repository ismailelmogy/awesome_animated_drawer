import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/locale/app_localizations.dart';
import '../widgets/confirmation_dialog.dart';
import 'app_strings.dart';
import 'app_colors.dart';

class Commons {
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(
                message,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: AppStrings.fontName),
              ),
              actions: <Widget>[
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.fontName,
                            fontSize: 14)),
                    onPressed: () => Navigator.of(context).pop(),
                    child:
                        Text(AppLocalizations.of(context)!.translate('ok')!)),
              ],
            ));
  }

  static void showToast(
      {required String message, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
    );
  }

  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => ConfirmationDialog(
            alertMsg:
                AppLocalizations.of(context)!.translate('want_to_logout')!,
            onTapConfirm: () {}));
  }

  static Future<void> openUrl(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static dynamic decodeJson(Response<dynamic> response) {
    var responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
