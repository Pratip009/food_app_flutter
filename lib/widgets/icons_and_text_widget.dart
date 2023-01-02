// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconsAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconsAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimesions.icon24,
        ),
        SizedBox(
          width: Dimesions.width5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
