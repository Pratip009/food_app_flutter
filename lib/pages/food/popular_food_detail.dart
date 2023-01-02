// ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icons_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimesions.height350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/food1.jpg"),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimesions.height45,
            left: Dimesions.width20,
            right: Dimesions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimesions.height350 - Dimesions.height20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimesions.width20,
                right: Dimesions.width20,
                top: Dimesions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimesions.radius20),
                  topRight: Radius.circular(Dimesions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  AppColumn(
                    text: 'Bitter Juicy Chicken',
                  ),
                  SizedBox(
                    height: Dimesions.height20,
                  ),
                  BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimesions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              'Chicken is delectable white meat and is one of the most common types of poultry in the world. Chicken meat is most preferred throughout different cuisines around the world. It provides essential vitamins mainly from the B complex including Niacin or vitamin B3, which is essential for the metabolism of fats in the body. It is lean meat with rich nutritional value, it is a great supply of protein which is important for sustaining our muscles. Chicken meat is largely used across most continents and is used to make a variety of dishes. One such dish is Butter Chicken Recipe or Murgh Makhani, which has become an inseparable part of Indian cuisine. It is one of the popular chicken curries that you can easily find around the world. Its popularity can also be understood by the fact that today several variations of this dish have come into existence. '),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimesions.height120,
        padding: EdgeInsets.only(
          top: Dimesions.height30,
          bottom: Dimesions.height30,
          left: Dimesions.width20,
          right: Dimesions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimesions.radius20 * 2),
            topRight: Radius.circular(Dimesions.radius20 * 2),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimesions.height20,
              bottom: Dimesions.height20,
              left: Dimesions.width20,
              right: Dimesions.width20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimesions.radius20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: Dimesions.width10 / 2,
                ),
                BigText(text: '0'),
                SizedBox(
                  width: Dimesions.width10 / 2,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimesions.height20,
              bottom: Dimesions.height20,
              left: Dimesions.width20,
              right: Dimesions.width20,
            ),
            child: BigText(
              text: '\$10 | Add to cart',
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimesions.radius20),
              color: AppColors.mainColor,
            ),
          ),
        ]),
      ),
    );
  }
}
