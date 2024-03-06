import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/Controllers/ControCart.dart';
import 'package:food_application/Data/repository/RepoProduct.dart';
import 'package:food_application/Models/ProductsModel.dart';
import 'package:food_application/Models/cartModel.dart';
import 'package:get/get.dart';


class ControProduct extends GetxController{
  final RepoProduct repoProduct;
  ControProduct({ required this.repoProduct });
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;
  late ControCart _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;


  Future<void> getProductList()async {
    Response response = await repoProduct.getProductList();
    if(response.statusCode == 200){
      print("Got Products");
      _productList=[];
      _productList.addAll(Products.fromJson(response.body).products);
      // print(_productList);
      _isLoaded = true;
      update();
    }
  }
  int _quantity = 0;
  int get quantity=>_quantity;
  int _inCardItems = 0;
  int get inCardItem => _inCardItems+_quantity;

  // void setIncrease(){
  //     _quantity = _quantity+1;
  //     if((_inCardItems+_quantity)>20){
  //       Get.snackbar('item count', "you can`t order more than 20 items",
  //         backgroundColor: AppColors.MainWhite,
  //         colorText: Colors.black,
  //       );
  //       _quantity = 20;
  //     }
  //     update();
  // }
  // void setDecrease(){
  //     if(_quantity>0){
  //       _quantity = _quantity-1;
  //     }
  //     update();
  // }

  void setQuantity(bool isIncrease){
    if(isIncrease){
      _quantity = checkQuantity(_quantity+1);

    }
    else{
        _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if (_inCardItems + quantity < 0) {
      Get.snackbar('Item count', "You can't order 0 items",
        backgroundColor: AppColors.MainWhite,
        colorText: Colors.black,
      );
      return 0;
    }
    else if (_inCardItems + quantity > 20) {
      Get.snackbar('Item count', "You can't order more than 20 items",
        backgroundColor: AppColors.MainWhite,
        colorText: Colors.black,
      );
      return 20;
    }
    else {
      return quantity;
    }
  }


  void initProduct(ProductsModel product, ControCart cart){
    _quantity = 0;
    _inCardItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print('exist or not ' + exist.toString());
    if(exist){
      _inCardItems = _cart.getQuantity(product);
    }
    print('this is in card items ' + _inCardItems.toString());
  }

  void addItem(ProductsModel product){
    if(_quantity>0){
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCardItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print('this is id ' + value.id.toString() + ' this is qauntity ' + value.quantity.toString());
      });
    }
    else{
      Get.snackbar('item count', "you can`t order 0 items",
        backgroundColor: AppColors.MainWhite,
        colorText: Colors.black,
      );
    }

    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<cartModel> get getItems{
    return _cart.getItems;
  }
}
