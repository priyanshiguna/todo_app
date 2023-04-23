import 'package:flutter/material.dart';

import '../constant/app_strings.dart';

class AppContainer extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? titleText;
  final String? image;

  const AppContainer({
    Key? key,
    this.color,
    this.text,
    this.image,
    this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                text!,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: AppStrings.fontOne,
                    fontSize: 16,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
            Image.asset(image!),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              titleText!,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.fontOne,
                  fontSize: 16,
                  color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ),
    );
  }
}
