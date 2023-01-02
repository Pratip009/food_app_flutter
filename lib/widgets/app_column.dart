import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icons_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimesions.font26,
        ),
        SizedBox(
          height: Dimesions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimesions.width30,
            ),
            SmallText(
              text: '4.5',
              color: AppColors.textColor,
            ),
            SizedBox(
              width: Dimesions.width30,
            ),
            SmallText(
              text: '1287 Comments',
              color: AppColors.textColor,
            ),
          ],
        ),
        SizedBox(
          height: Dimesions.height20,
        ),
        Row(
          children: [
            IconsAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),
            SizedBox(
              width: Dimesions.width30,
            ),
            IconsAndTextWidget(
                icon: Icons.location_city,
                text: '1.7km',
                iconColor: AppColors.mainColor),
            SizedBox(
              width: Dimesions.width30,
            ),
            IconsAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
