import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DefaultDropdownButtonFormField extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic value;
  final String? hintTxt;
  final String? Function(dynamic)? validationFunction;
  final Function(dynamic)? onChangedFunction;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? icon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? labelTxt;
  final bool isExpanded;
  final AutovalidateMode autovalidateMode;
  final Color? unfocusColor;
  final Color? hintColor;
  final Color? filledColor;
  final bool filled;

  const DefaultDropdownButtonFormField({
    Key? key,
    required this.items,
    this.value,
    this.icon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintTxt,
    this.validationFunction,
    this.onChangedFunction,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.labelTxt,
    this.isExpanded = true,
    this.unfocusColor,
    this.hintColor,
    this.filled = true,
    this.filledColor,
  }) : super(key: key);

  @override
  State<DefaultDropdownButtonFormField> createState() =>
      _DefaultDropdownButtonFormFieldState();
}

class _DefaultDropdownButtonFormFieldState
    extends State<DefaultDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: DropdownButtonFormField(
          autovalidateMode: widget.autovalidateMode,
          icon: widget.icon ??
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: AppColors.hintColor,
              ),
          style: Theme.of(context).textTheme.labelSmall,
          value: widget.value,
          isExpanded: widget.isExpanded,
          decoration: InputDecoration(
            filled: widget.filled ? true : false,
            fillColor: widget.filledColor ?? Colors.white,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintTxt,
            labelText: widget.labelTxt,
          ),
          onChanged: widget.onChangedFunction,
          items: widget.items,
          validator: widget.validationFunction,
        ));
  }
}
