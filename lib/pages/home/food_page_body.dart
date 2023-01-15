// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/pages/food/popular_food_detail.dart';
import 'package:flutter_application_1/routes/route_helper.dart';

import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icons_and_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimesions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimesions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        // ignore: unnecessary_new
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //popular section
        SizedBox(
          height: Dimesions.height20,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimesions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimesions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimesions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food Pairing'),
              ),
            ],
          ),
        ),
        //list of food and images

        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimesions.width20,
                          right: Dimesions.width20,
                          bottom: Dimesions.height10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: Dimesions.imagewidth120,
                              height: Dimesions.imagewidth120,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimesions.radius15),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      AppConstants.UPLOAD_URL +
                                      recommendedProduct
                                          .recommendedProductList[index].img!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimesions.height100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimesions.radius15),
                                    bottomRight:
                                        Radius.circular(Dimesions.radius15),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimesions.width10,
                                    right: Dimesions.width5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimesions.height10,
                                      ),
                                      SmallText(
                                          text: 'with Indian characteristics'),
                                      SizedBox(
                                        height: Dimesions.height10,
                                      ),
                                      Row(
                                        children: [
                                          IconsAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: AppColors.iconColor1),
                                          SizedBox(
                                            width: Dimesions.width2,
                                          ),
                                          IconsAndTextWidget(
                                              icon: Icons.location_city,
                                              text: '1.7km',
                                              iconColor: AppColors.mainColor),
                                          SizedBox(
                                            width: Dimesions.width2,
                                          ),
                                          IconsAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: '32min',
                                              iconColor: AppColors.iconColor2),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, popularProduct) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimesions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimesions.width10,
                right: Dimesions.width10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimesions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimesions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimesions.width30,
                right: Dimesions.width30,
                bottom: Dimesions.width30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimesions.radius30),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe3e3e3),
                    blurRadius: 0.5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimesions.height10,
                    left: Dimesions.width15,
                    right: Dimesions.width15),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
