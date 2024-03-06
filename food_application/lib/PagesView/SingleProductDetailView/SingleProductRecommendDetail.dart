import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/Controllers/ControProduct.dart';
import 'package:food_application/Controllers/ControProductRecommend.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';

import '../../Controllers/ControCart.dart';
import '../../WidgetItems/DiscriptionText.dart';
import '../Cart/CartPage.dart';

class RecommendProductDetail extends StatelessWidget {
  int pageId;

  RecommendProductDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<ControProductRecommend>().ProductRecommendList[pageId];
    Get.find<ControProduct>().initProduct(product, Get.find<ControCart>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => {
                            Get.back(),
                          },
                      child: BtnIconBar(
                        icon: Icons.clear,
                      )),
                  GetBuilder<ControProduct>(builder: (controller) {
                    return Stack(children: [
                      GestureDetector(
                        onTap : () => {
                          Get.to(()=>const CartPage())
                        },
                        child: BtnIconBar(
                          icon: Icons.shopping_cart,
                          iconSize: dimensionPage.iconSize16,
                        ),
                      ),
                      Get.find<ControProduct>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: BtnIconBar(
                                icon: Icons.circle,
                                size: 20,
                                color: Color.fromARGB(255, 255, 79, 68),
                              ),
                            )
                          : Container(),
                      Get.find<ControProduct>().totalItems >= 1
                          ? Positioned(
                              right: 2.5,
                              top: 3,
                              child: TextWidget(
                                text: Get.find<ControProduct>()
                                    .totalItems
                                    .toString(),
                                size: 12,
                                color: AppColors.MainWhite,
                              ))
                          : Container()
                    ]);
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(dimensionPage.radius20),
                          topRight: Radius.circular(dimensionPage.radius20))),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Center(
                      child: TextWidget(
                    text: product.name!,
                    size: dimensionPage.font26,
                  )),
                ),
              ),
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                AppConstant.BASE_URL + '/uploads/' + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  left: dimensionPage.width10,
                  right: dimensionPage.width10,
                ),
                child: DiscriptionText(
                  text: product.description!,
                  overFlow: TextOverflow.visible,
                  height: 1.8,
                  size: dimensionPage.font16,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<ControProduct>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: dimensionPage.width45,
                    right: dimensionPage.width45,
                    bottom: dimensionPage.height10,
                    top: dimensionPage.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => {
                              controller.setQuantity(false),
                            },
                        child: BtnIconBar(
                          icon: Icons.remove,
                          iconBackgroundColor: AppColors.Darkviolet,
                          color: Colors.white,
                        )),
                    TextWidget(
                        text: '${product.price!}\$ X  ${controller.inCardItem}'),
                    GestureDetector(
                        onTap: () => {
                              controller.setQuantity(true),
                            },
                        child: BtnIconBar(
                          icon: Icons.add,
                          iconBackgroundColor: AppColors.Darkviolet,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Container(
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
                      padding: EdgeInsets.all(dimensionPage.width20),
                      height: dimensionPage.bottonBarHeight - 40,
                      decoration: BoxDecoration(
                          color: AppColors.SeconderyWhite,
                          borderRadius:
                              BorderRadius.circular(dimensionPage.radius10)),
                      child: Icon(Icons.favorite),
                    ),
                    SizedBox(
                      width: dimensionPage.width10,
                    ),
                    GestureDetector(
                      onTap: () => {
                        controller.addItem(product),
                      },
                      child: Container(
                        padding: EdgeInsets.all(dimensionPage.width20),
                        height: dimensionPage.bottonBarHeight - 40,
                        decoration: BoxDecoration(
                            color: AppColors.Darkviolet,
                            borderRadius:
                                BorderRadius.circular(dimensionPage.radius10)),
                        child: TextWidget(
                          text: '\$ ${product.price!} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
