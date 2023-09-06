import 'package:flutter/material.dart';
import 'consts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget trailing;

  const CustomAppBar({required this.title, required this.trailing, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: textColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: "SenBold"),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: menuBarBackground,
            ),
            width: 53,
            height: 53,
            padding: const EdgeInsets.all(10),
            child: trailing,
          )
        ],
      ),
    );
  }
}
