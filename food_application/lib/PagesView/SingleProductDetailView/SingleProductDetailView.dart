import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_application/Controllers/ControProduct.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/WidgetItems/ExtantableTextWidget.dart';
import 'package:food_application/WidgetItems/SingleProductCardItem.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';
import '../../ColorsTheme/ColorsThemes.dart';
import '../../WidgetItems/TextWidget.dart';

class SingleProductDetailPage extends StatelessWidget {
  int pageId;

  SingleProductDetailPage({super.key,
    required this.pageId
  });

  @override
  Widget build(BuildContext context) {
    var products = Get.find<ControProduct>().productList[pageId];
    Get.find<ControProduct>().initProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: dimensionPage.deFoodImg,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstant.BASE_URL+'/uploads/'+products.img!),
                ),
              ),
            ),
          ),
          Positioned(
            left: dimensionPage.width20,
            right: dimensionPage.width20,
            top: dimensionPage.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {
                    Get.back(),
                  },
                  child: BtnIconBar(
                    icon: Icons.arrow_back_ios_new_outlined,
                    iconSize: dimensionPage.iconSize16,
                  ),
                ),
                BtnIconBar(
                  icon: Icons.shopping_cart,
                  iconSize: dimensionPage.iconSize16,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: dimensionPage.listViewImgSize * 2.5,
            child: Container(
              padding: EdgeInsets.only(
                  left: dimensionPage.width20,
                  right: dimensionPage.width20,
                  top: dimensionPage.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensionPage.radius20),
                      topRight: Radius.circular(dimensionPage.radius20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleProductCard(
                    text: products.name!,
                    stars: products.stars!,
                    rating: products.stars!.toString(),
                  ),
                  SizedBox(
                    height: dimensionPage.height20,
                  ),
                  TextWidget(text: 'Introduce'),
                  SizedBox(
                    height: dimensionPage.height20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExtandableTextWidget(
                              text:products.description!))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<ControProduct>(builder: (popularProduct){
        return Container(
          height: dimensionPage.bottonBarHeight,
          padding: EdgeInsets.only(
              left: dimensionPage.width20,
              right: dimensionPage.width20,
              top: dimensionPage.height30,
              bottom: dimensionPage.height30),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(dimensionPage.width10),
                height: dimensionPage.bottonBarHeight - 40,
                decoration: BoxDecoration(
                    color: AppColors.LightShadowColor,
                    borderRadius: BorderRadius.circular(dimensionPage.radius10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => {
                            popularProduct.setDecrease(),
                        },
                        child: const Icon(Icons.remove)),
                    SizedBox(
                      width: dimensionPage.width15,
                    ),
                    TextWidget(
                      text: popularProduct.quantity.toString(),
                      size: dimensionPage.font26,
                      color: AppColors.Darkviolet,
                    ),
                    SizedBox(
                      width: dimensionPage.width15,
                    ),
                    GestureDetector(
                        onTap: () => {
                            popularProduct.setIncrease(),
                        },
                        child: const Icon(Icons.add))
                  ],
                ),
              ),
              SizedBox(
                width: dimensionPage.width10,
              ),
              Container(
                height: dimensionPage.bottonBarHeight - 20,
                padding: EdgeInsets.only(
                    left: dimensionPage.width45, right: dimensionPage.width45),
                decoration: BoxDecoration(
                  color: AppColors.Darkviolet,
                  borderRadius: BorderRadius.circular(dimensionPage.radius10),
                ),
                child: Center(
                    child: DiscriptionText(
                      text: '${products.price!}\$ | Add To Cart',
                      color: AppColors.MainWhite,
                    )),
              ),
            ],
          ),
        );
      }
      ),
    );
  }
}
