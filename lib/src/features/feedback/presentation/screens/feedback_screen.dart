import 'package:awesome_animated_drawer/src/core/utils/app_strings.dart';
import '../../../../config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/utils/app_colors.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColors.nearlyWhite,
          body: SingleChildScrollView(
            child: SizedBox(
              height: context.height,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset(AppImages.feedbackImage),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      AppLocalizations.of(context)!.translate('your_feedback')!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate('give_your_best_time_for_this_moment')!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _buildComposer(),
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
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('send')!,
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
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: Colors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {},
                style: const TextStyle(
                  fontFamily: AppStrings.fontName,
                  fontSize: 16,
                  color: AppColors.darkGrey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!
                        .translate('enter_your_feedback')!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
