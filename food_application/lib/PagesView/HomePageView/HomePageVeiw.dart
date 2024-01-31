import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:food_application/utils/dimension.dart';

import 'HomePageBody.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    print('Screen width = ' + MediaQuery.of(context).size.width.toString());
    print('Screen height = ' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: AppColors.SeconderyWhite,
      body: Column(
        children: [
          // head
          Container(
            padding: EdgeInsets.only(top: dimensionPage.height45, bottom: dimensionPage.height15),
            margin: EdgeInsets.only(left: dimensionPage.width20,right: dimensionPage.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(text: AppConstant.APP_NAME, color: AppColors.Darkviolet,),
                    Row(
                      children: [
                        DiscriptionText(text: 'city', color: AppColors.SecondaryDark,),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                Container(
                  width: dimensionPage.width45,
                  height: dimensionPage.height45,
                  decoration: BoxDecoration(
                    color: AppColors.Darkviolet,
                    borderRadius: BorderRadius.circular(dimensionPage.radius10+5),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: dimensionPage.iconSize24,),
                ),
              ],
            ),
            ),
          // body
          const Expanded(
            flex: 1,
              child: SingleChildScrollView(
                child:  HomePageBody(),
              )),
        ],
      ),
    );
  }
}