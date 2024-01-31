import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/Controllers/ControProductRecommend.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';

import '../../WidgetItems/DiscriptionText.dart';

class RecommendProductDetail extends StatelessWidget {
  int pageId;
  RecommendProductDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var productRecommended = Get.find<ControProductRecommend>().ProductRecommendList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: ()=>{
                      Get.back(),
                    },
                    child: BtnIconBar(icon: Icons.clear,)),
                BtnIconBar(icon: Icons.shopping_cart_outlined,),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(dimensionPage.radius20),topRight: Radius.circular(dimensionPage.radius20))
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(child: TextWidget(text: productRecommended.name!, size: dimensionPage.font26,)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              AppConstant.BASE_URL+'/uploads/'+productRecommended.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: dimensionPage.width10,right: dimensionPage.width10,),
              child: DiscriptionText(
                text: productRecommended.description!,
                overFlow: TextOverflow.visible,
                height: 1.8,
                size: dimensionPage.font16,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: dimensionPage.width45, right: dimensionPage.width45,bottom: dimensionPage.height10,top: dimensionPage.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnIconBar(icon: Icons.remove,iconBackgroundColor: AppColors.Darkviolet,color: Colors.white,),
                TextWidget(text: '${productRecommended.price!}\$'+' X '+' 0'),
                BtnIconBar(icon: Icons.add, iconBackgroundColor: AppColors.Darkviolet, color: Colors.white,),
              ],
            ),
          ),
          Container(
            height: dimensionPage.bottonBarHeight,
            padding: EdgeInsets.only(left: dimensionPage.width20, right: dimensionPage.width20, top: dimensionPage.height30, bottom: dimensionPage.height30),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(dimensionPage.width20),
                  height: dimensionPage.bottonBarHeight-40,
                  decoration: BoxDecoration(
                      color: AppColors.LightShadowColor,
                      borderRadius: BorderRadius.circular(dimensionPage.radius10)
                  ),
                  child: Icon(Icons.favorite),
                ),
                SizedBox(width: dimensionPage.width10,),
                Container(
                  height: dimensionPage.bottonBarHeight-20,
                  padding: EdgeInsets.only(left: dimensionPage.width45, right: dimensionPage.width45),
                  decoration: BoxDecoration(
                    color: AppColors.Darkviolet,
                    borderRadius: BorderRadius.circular(dimensionPage.radius10),
                  ),
                  child: Center(
                      child: DiscriptionText(text: ' Add To Cart', color: AppColors.MainWhite,)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
