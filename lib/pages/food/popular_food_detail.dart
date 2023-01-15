// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, must_be_immutable

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/pages/cart/cart_page.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';


class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

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
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
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
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => MainFoodPage(),
                    );
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => CartPage());
                            },
                            child: AppIcon(
                                icon: Icons.shopping_cart_checkout_outlined)),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                top: 4,
                                right: 4,
                                child: BigText(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                )
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
                    text: product.name!,
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
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimesions.width10 / 2,
                        ),
                        BigText(text: popularProduct.inCartItems.toString()),
                        SizedBox(
                          width: Dimesions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimesions.height20,
                        bottom: Dimesions.height20,
                        left: Dimesions.width20,
                        right: Dimesions.width20,
                      ),
                      child: BigText(
                        text: '₹ ${product.price!} | Add to cart',
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimesions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
