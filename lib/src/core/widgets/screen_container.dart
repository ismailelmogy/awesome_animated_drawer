import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  const ScreenContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ));
  }
}
