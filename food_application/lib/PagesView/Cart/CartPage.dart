
import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/Controllers/ControCart.dart';
import 'package:food_application/PagesView/HomePageView/HomePageVeiw.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: dimensionPage.width20,
              right: dimensionPage.width20,
              top: dimensionPage.height20 + 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                GestureDetector(
                  onTap: () => {
                    Get.back(),
                  },
                  child: BtnIconBar(
                    icon: Icons.arrow_back_ios_new_outlined,
                    iconBackgroundColor: AppColors.Darkviolet,
                    color: AppColors.MainWhite,
                    iconSize: dimensionPage.iconSize24,
                  ),
                ),
                SizedBox(
                  width: dimensionPage.width20*5,
                ),
                GestureDetector(
                  onTap: () => {
                    Get.to(()=>const HomePageView()),
                  },
                  child: BtnIconBar(
                    icon: Icons.home,
                    iconBackgroundColor: AppColors.Darkviolet,
                    color: AppColors.MainWhite,
                    iconSize: dimensionPage.iconSize24,
                  ),
                ),
                BtnIconBar(
                  icon: Icons.shopping_cart_outlined,
                  iconBackgroundColor: AppColors.Darkviolet,
                  color: AppColors.MainWhite,
                  iconSize: dimensionPage.iconSize24,
                ),
              ])),
          Positioned(
            left: dimensionPage.width20,
            right: dimensionPage.width20,
            top: dimensionPage.height20*5,
            bottom: 0,
            child: Container(
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:  GetBuilder<ControCart>(builder: (cartController){
                  return  ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                            children: [
                              Container(
                                height: dimensionPage.height20*5,
                                width: dimensionPage.height20*5,
                                margin: EdgeInsets.only(bottom: dimensionPage.height15, top: dimensionPage.height15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(dimensionPage.radius20),
                                    image: DecorationImage(
                                        image: NetworkImage(AppConstant.BASE_URL + '/uploads/' + cartController.getItems[index].img!),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              SizedBox(width: dimensionPage.width10,),
                              Expanded(child: Container(
                                height: dimensionPage.height20*5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextWidget(text: cartController.getItems[index].name!, color: Colors.black54,),
                                    DiscriptionText(text: "asadfwe"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(text: cartController.getItems[index].price!.toString() + "\$", color: Colors.redAccent,),
                                        Container(
                                            height: dimensionPage.height20,
                                            // color: Colors.black,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => {
                                                  },
                                                  child: BtnIconBar(
                                                    icon: Icons.remove,
                                                    color: AppColors.Darkviolet,
                                                  ),
                                                ),
                                                TextWidget(text: cartController.totalItems.toString(), color: Colors.green,),
                                                GestureDetector(
                                                  onTap: () => {
                                                  },
                                                  child: BtnIconBar(
                                                    icon: Icons.add,
                                                    color: AppColors.Darkviolet,
                                                  ),
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ]
                        ),
                      );
                    },
                  );
                }
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
