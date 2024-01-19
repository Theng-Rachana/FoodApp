import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/dimension.dart';
import 'package:get/get.dart';

import '../../WidgetItems/DiscriptionText.dart';

class RecommendProductDetail extends StatelessWidget {
  const RecommendProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnIconBar(icon: Icons.clear,),
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
                child: Center(child: TextWidget(text: "Berger", size: dimensionPage.font26,)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/images/food5.jpeg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: dimensionPage.width10,right: dimensionPage.width10,),
              child: DiscriptionText(
                text: 'A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]',
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
                TextWidget(text: '\$12.00'+'X'+'0'),
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
                      child: TextWidget(text: '10\$ | Add To Cart', color: AppColors.MainWhite,)
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
