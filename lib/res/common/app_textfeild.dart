import 'package:flutter/material.dart';

import '../constant/app_strings.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;

  const TextFieldContainer(
      {Key? key,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.maxLines,
      this.minLines,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        suffixIcon: suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xC5FFFFFF),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1AB8DB),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFD2C3C3),
          fontWeight: FontWeight.w400,
          fontFamily: AppStrings.fontTwo,
          fontSize: 17,
        ),
      ),
    );
  }
}
