import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';
import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
