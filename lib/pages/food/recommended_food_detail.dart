// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/pages/cart/cart_page.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';

import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => CartPage());
                                    },
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor,
                                    ),
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
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                    child: BigText(
                      text: product.name!,
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
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
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
                    child: ExpandableTextWidget(text: product.description!),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
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
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: Dimesions.icon24,
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                      text: '₹ ${product.price!} X  ${controller.inCartItems}',
                      color: AppColors.mainBlackColor,
                      size: Dimesions.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimesions.icon24,
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
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
                          borderRadius:
                              BorderRadius.circular(Dimesions.radius20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
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
                            borderRadius:
                                BorderRadius.circular(Dimesions.radius20),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          );
        }));
  }
}
