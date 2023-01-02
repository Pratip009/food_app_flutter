// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: 'Bitter Juicy Chicken',
                    size: Dimesions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimesions.height10,
                  bottom: Dimesions.height10,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimesions.radius20),
                      topRight: Radius.circular(Dimesions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.black54,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/food1.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimesions.width10,
                    right: Dimesions.width10,
                    bottom: Dimesions.height20,
                  ),
                  child: ExpandableTextWidget(
                      text:
                          'Chicken is delectable white meat and is one of the most common types of poultry in the world. Chicken meat is most preferred throughout different cuisines around the world. It provides essential vitamins mainly from the B complex including Niacin or vitamin B3, which is essential for the metabolism of fats in the body. It is lean meat with rich nutritional value, it is a great supply of protein which is important for sustaining our muscles. Chicken meat is largely used across most continents and is used to make a variety of dishes. One such dish is Butter Chicken Recipe or Murgh Makhani, which has become an inseparable part of Indian cuisine. It is one of the popular chicken curries that you can easily find around the world. Its popularity can also be understood by the fact that today several variations of this dish have come into existence.Chicken is delectable white meat and is one of the most common types of poultry in the world. Chicken meat is most preferred throughout different cuisines around the world. It provides essential vitamins mainly from the B complex including Niacin or vitamin B3, which is essential for the metabolism of fats in the body. It is lean meat with rich nutritional value, it is a great supply of protein which is important for sustaining our muscles. Chicken meat is largely used across most continents and is used to make a variety of dishes. One such dish is Butter Chicken Recipe or Murgh Makhani, which has become an inseparable part of Indian cuisine. It is one of the popular chicken curries that you can easily find around the world. Its popularity can also be understood by the fact that today several variations of this dish have come into existence.Chicken is delectable white meat and is one of the most common types of poultry in the world. Chicken meat is most preferred throughout different cuisines around the world. It provides essential vitamins mainly from the B complex including Niacin or vitamin B3, which is essential for the metabolism of fats in the body. It is lean meat with rich nutritional value, it is a great supply of protein which is important for sustaining our muscles. Chicken meat is largely used across most continents and is used to make a variety of dishes. One such dish is Butter Chicken Recipe or Murgh Makhani, which has become an inseparable part of Indian cuisine. It is one of the popular chicken curries that you can easily find around the world. Its popularity can also be understood by the fact that today several variations of this dish have come into existence.Chicken is delectable white meat and is one of the most common types of poultry in the world. Chicken meat is most preferred throughout different cuisines around the world. It provides essential vitamins mainly from the B complex including Niacin or vitamin B3, which is essential for the metabolism of fats in the body. It is lean meat with rich nutritional value, it is a great supply of protein which is important for sustaining our muscles. Chicken meat is largely used across most continents and is used to make a variety of dishes. One such dish is Butter Chicken Recipe or Murgh Makhani, which has become an inseparable part of Indian cuisine. It is one of the popular chicken curries that you can easily find around the world. Its popularity can also be understood by the fact that today several variations of this dish have come into existence.'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimesions.width50,
              right: Dimesions.width50,
              top: Dimesions.height10,
              bottom: Dimesions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimesions.icon24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: '\$12.88 ' + ' X ' + ' 0',
                  color: AppColors.mainBlackColor,
                  size: Dimesions.font26,
                ),
                AppIcon(
                  iconSize: Dimesions.icon24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
