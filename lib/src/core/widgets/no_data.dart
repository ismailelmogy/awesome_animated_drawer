import 'package:flutter/material.dart';
import '../../config/locale/app_localizations.dart';
import '../utils/app_images.dart';
import '../utils/hex_color.dart';

class NoData extends StatelessWidget {
  final String? message;
  final double height;
  const NoData({Key? key, this.message, this.height = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AppImages.noData,
            height: height,
          ),
        ),
        Text(message ?? AppLocalizations.of(context)!.translate('no_data')!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: HexColor('#09004B'),
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
