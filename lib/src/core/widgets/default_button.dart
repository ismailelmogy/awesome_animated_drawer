import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class DefaultButton extends StatelessWidget {
  final String btnLbl;
  final bool enableMargin;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;

  const DefaultButton(
      {Key? key,
      required this.btnLbl,
      this.enableMargin = true,
      required this.onPressed,
      this.borderRadius = const BorderRadius.all(Radius.circular(20))})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: 60,
            width: context.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                colors: [
                  Color(0xff2C0B4F),
                  Color(0xff311B92),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topRight,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: enableMargin ? 36 : 0),
            child: Center(
              child: Text(
                btnLbl,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            )));
  }
}
