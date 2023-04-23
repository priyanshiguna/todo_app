import 'package:flutter/material.dart';

class AppDateAndTimeContainer extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool? isData;

  const AppDateAndTimeContainer({
    Key? key,
    this.hintText,
    this.icon,
    this.isData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 1,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            hintText ?? "",
            style: TextStyle(
              color: isData! ? Colors.black : const Color(0xFFD2C3C3),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Icon(icon!)
        ],
      ),
    );
  }
}
