// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimesions.width20,
            right: Dimesions.width20,
            top: Dimesions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimesions.icon24,
                ),
                SizedBox(
                  width: Dimesions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimesions.icon24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimesions.icon24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimesions.height20 * 5,
            left: Dimesions.width20,
            right: Dimesions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimesions.height15),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (CartController) {
                      return ListView.builder(
                          itemCount: CartController.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: Dimesions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Container(
                                    width: Dimesions.height20 * 5,
                                    height: Dimesions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimesions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                AppConstants.UPLOAD_URL +
                                                CartController
                                                    .getItems[index].img!),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimesions.radius20),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimesions.width10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Dimesions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: CartController
                                                .getItems[index].name!,
                                            color: Colors.black54,
                                          ),
                                          SmallText(text: 'spicy'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: CartController
                                                    .getItems[index].price!
                                                    .toString(),
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: Dimesions.height20,
                                                  bottom: Dimesions.height20,
                                                  left: Dimesions.width20,
                                                  right: Dimesions.width20,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimesions.radius20),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // popularProduct.setQuantity(false);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimesions.width10 / 2,
                                                    ),
                                                    BigText(text: '0'),
                                                    // popularProduct.inCartItems.toString()),
                                                    SizedBox(
                                                      width:
                                                          Dimesions.width10 / 2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // popularProduct.setQuantity(true);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
