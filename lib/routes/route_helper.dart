// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable

import 'package:flutter_application_1/pages/food/popular_food_detail.dart';
import 'package:flutter_application_1/pages/food/recommended_food_detail.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId = $pageId';

  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId = $pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: 0);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId: 1);
      },
      transition: Transition.fadeIn,
    ),
  ];
}
