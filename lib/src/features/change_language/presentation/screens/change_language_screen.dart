import 'package:awesome_animated_drawer/src/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/locale_bloc.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColors.nearlyWhite,
          body: Column(
            children: <Widget>[
              appBar(),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.translate('arabic')!,
                ),
                leading: Radio(
                  focusColor: AppColors.primaryColor,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.primaryColor),
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 5,
                  color: AppColors.grey.withOpacity(0.6),
                ),
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.translate('english')!,
                ),
                leading: Radio(
                  focusColor: AppColors.primaryColor,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.primaryColor),
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(4, 4),
                            blurRadius: 8.0),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (_radioValue == 1 &&
                              AppLocalizations.of(context)!.isEnLocale) {
                            BlocProvider.of<LocaleBloc>(context)
                                .add(const ChangeLangToArabicEvent());
                          } else if (_radioValue == 2 &&
                              !AppLocalizations.of(context)!.isEnLocale) {
                            BlocProvider.of<LocaleBloc>(context)
                                .add(const ChangeLangToEnglishEvent());
                          }
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              AppLocalizations.of(context)!.translate('save')!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.translate('main_language')!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
        ],
      ),
    );
  }
}
