import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';

class DefaultTextFormField extends StatefulWidget {
  final bool enabled;
  final String? initialValue;
  final String? hintTxt;
  final bool borderIsEnabled;
  final bool marginIsEnabled;
  final TextInputType? inputData;
  final bool isPassword;
  final double radius;
  final bool readOnly;
  final String? Function(String?)? validationFunction;
  final dynamic Function(String?)? onChangedFunction;
  final ValueChanged<String>? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? labelTxt;
  final bool expands;
  final TextEditingController? controller;
  final Color? unfocusColor;
  final Color? hintColor;
  final Color? focusColor;
  final Color? filledColor;
  final bool filled;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final String? helperText;

  const DefaultTextFormField({
    Key? key,
    this.hintTxt,
    this.onFieldSubmitted,
    this.inputData,
    this.borderIsEnabled = true,
    this.isPassword = false,
    this.readOnly = false,
    this.validationFunction,
    this.onChangedFunction,
    this.initialValue,
    this.suffixIcon,
    this.radius = 32,
    this.maxLength,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.maxLines,
    this.expands = false,
    this.labelTxt,
    this.prefix,
    this.unfocusColor,
    this.hintColor,
    this.focusColor,
    this.suffix,
    this.filled = true,
    this.marginIsEnabled = true,
    this.filledColor,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
    this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.helperText,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool _obsecureText = true;

  Widget _buildTextFormField() {
    return StatefulBuilder(
        builder: (context, setState) => TextFormField(
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              textInputAction: widget.textInputAction,
              autovalidateMode: widget.autovalidateMode,
              inputFormatters: widget.inputFormatters,
              expands: widget.expands,
              controller: widget.controller,
              enabled: widget.enabled,
              maxLines: widget.isPassword ? 1 : widget.maxLines,
              maxLength: widget.maxLength,
              initialValue: widget.initialValue,
              style: Theme.of(context).textTheme.labelSmall,
              decoration: InputDecoration(
                helperText: widget.helperText,
                filled: widget.filled ? true : false,
                fillColor: widget.filledColor ?? Colors.white,
                suffix: widget.suffix,
                suffixIcon: widget.isPassword
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        child: Icon(
                          _obsecureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                      )
                    : widget.suffixIcon,
                border: !widget.borderIsEnabled
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius),
                        borderSide: BorderSide(color: AppColors.hintColor)),
                enabledBorder: !widget.borderIsEnabled
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius),
                        borderSide: BorderSide(color: AppColors.hintColor)),
                focusedBorder: !widget.borderIsEnabled
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(widget.radius),
                      ),
                prefix: widget.prefix,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hintTxt,
                labelText: widget.labelTxt,
              ),
              keyboardType: widget.inputData,
              obscureText: widget.isPassword ? _obsecureText : false,
              validator: widget.validationFunction,
              onChanged: widget.onChangedFunction,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: widget.marginIsEnabled ? 16 : 0),
        child: _buildTextFormField());
  }
}
