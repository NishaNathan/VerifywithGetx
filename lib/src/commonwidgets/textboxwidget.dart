import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    Key? key,
    required this.fillColor,
    this.hintText,
    this.validator,
    this.width,
    this.maxLength,
    this.textAlign,
    this.fontWeight,
    this.counterText,
    this.onChanged,
    this.controller,
    this.errorText,
    this.errorColor, this.regexExp,
  }) : super(key: key);

  final Color fillColor;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final double? width;
  final int? maxLength;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String? counterText;
  final TextEditingController? controller;
  final String? errorText;
  final Color? errorColor;
  final RegExp? regexExp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        maxLength: maxLength,
        textAlign: textAlign!,
        style: TextStyle(fontWeight: fontWeight),
        decoration: InputDecoration(
          errorStyle: TextStyle(color: errorColor),
          counterText: counterText,
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorText: errorText,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(
              RegExp(regexExp!.pattern)), // Deny special characters
        ],
      ),
    );
  }
}
