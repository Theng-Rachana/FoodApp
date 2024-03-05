import 'package:food_application/Data/repository/RepoProduct.dart';
import 'package:food_application/Models/ProductsModel.dart';
import 'package:get/get.dart';

import '../Data/repository/RepoProductRecommend.dart';

class ControProductRecommend extends GetxController{
  final RepoProductRecommend repoProductRecommend;
  ControProductRecommend({ required this.repoProductRecommend });
  List<dynamic> _ProductRecommendList = [];
  List<dynamic> get ProductRecommendList => _ProductRecommendList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getProductRecommendList()async {
    Response response = await repoProductRecommend.getProductRecommendList();
    if(response.statusCode == 200){
      // print("Got Products");
      _ProductRecommendList=[];
      _ProductRecommendList.addAll(Products.fromJson(response.body).products);
      // print(_productList);
      _isLoaded = true;
      update();
    }
  }
}