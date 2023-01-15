// ignore_for_file: unused_field, prefer_final_fields


import 'package:flutter_application_1/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print("got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Products.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    }
  }
}
