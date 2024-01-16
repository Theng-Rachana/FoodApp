import 'package:flutter/material.dart';
import 'package:food_application/WidgetItems/BtnIconBar.dart';
import 'package:food_application/WidgetItems/ExtantableTextWidget.dart';
import 'package:food_application/WidgetItems/SingleProductCardItem.dart';
import 'package:food_application/utils/dimension.dart';

import '../../ColorsTheme/ColorsThemes.dart';
import '../../WidgetItems/TextWidget.dart';

class SingleProductDetailPage extends StatelessWidget {
  const SingleProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: dimensionPage.deFoodImg,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage('assets/images/food5.jpeg'),
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
                  BtnIconBar(
                  icon: Icons.arrow_back_ios_new_outlined,
                  iconSize: dimensionPage.iconSize16,
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
              top: dimensionPage.listViewImgSize*2.5,
              child: Container(
                padding: EdgeInsets.only(left: dimensionPage.width20,right: dimensionPage.width20,top: dimensionPage.height20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(dimensionPage.radius20),topRight: Radius.circular(dimensionPage.radius20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SingleProductCard(text: 'Chicken Fried',),
                    SizedBox(height: dimensionPage.height20,),
                    TextWidget(text: 'Introduce'),
                    SizedBox(height: dimensionPage.height20,),
                    const Expanded(child: SingleChildScrollView(child: ExtandableTextWidget(text: 'A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]A hamburger, or simply burger, is a food consisting offood consisting of food consisting of food consisting of  fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.[1]'))),
                  ],
                ),
              ),),
        ],
      ),
      bottomNavigationBar: Container(
        height: dimensionPage.bottonBarHeight,
        padding: EdgeInsets.only(left: dimensionPage.width20, right: dimensionPage.width20, top: dimensionPage.height30, bottom: dimensionPage.height30),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(dimensionPage.width10),

              height: dimensionPage.bottonBarHeight-40,
              decoration: BoxDecoration(
                  color: AppColors.LightShadowColor,
                borderRadius: BorderRadius.circular(dimensionPage.radius10)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.remove),
                  SizedBox(width: dimensionPage.width15,),
                  TextWidget(text: '0' ,size: dimensionPage.font26, color: AppColors.Darkviolet,),
                  SizedBox(width: dimensionPage.width15,),
                  const Icon(Icons.add)
                ],
              ),
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
    );
  }
}
