import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_application/ColorsTheme/ColorsThemes.dart';
import 'package:food_application/WidgetItems/DiscriptionText.dart';
import 'package:food_application/WidgetItems/IconNText.dart';
import 'package:food_application/WidgetItems/TextWidget.dart';
import 'package:food_application/utils/dimension.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = dimensionPage.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider
        Container(
          margin: EdgeInsets.only(top: dimensionPage.height20),
          height: 340,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, position) {
                return _PageBodyBuildItem(
                    position, currPageValue, _height, _scaleFactor);
              }),
        ),
        // page indicator
        DotsIndicator(
          dotsCount: 5,
          position: currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.Darkviolet,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: dimensionPage.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: dimensionPage.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget(text: 'Popular'),
              SizedBox(
                width: dimensionPage.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: TextWidget(
                    text: ".",
                    color: AppColors.LightShadowColor,
                  )),
              SizedBox(
                width: dimensionPage.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: DiscriptionText(text: "Food padding")),
            ],
          ),
        ),
        //Food List
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(
                    left: dimensionPage.width20,
                    right: dimensionPage.width20,
                    bottom: dimensionPage.height10),
                decoration: BoxDecoration(
                  color: AppColors.MainWhite,
                  borderRadius: BorderRadius.circular(dimensionPage.radius20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: dimensionPage.listViewImgSize,
                      height: dimensionPage.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensionPage.radius15),
                          // color: AppColors.MainWhite,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/food5.jpeg'),
                          )),
                    ),
                    Expanded(
                      child: Container(
                        height: dimensionPage.listViewTextSize,
                        padding: EdgeInsets.all(dimensionPage.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: 'PizzaPizzaPizzaPizzaPizzaPizza', overFlow: TextOverflow.ellipsis),
                            DiscriptionText(text: 'To debug a layout issue, run the app in debug mode and open the inspector by clicking the Flutter Inspector tab on the DevTools toolbar. info Note: You can still access the Flutter inspector directly from Android Studio/IntelliJ, but you might prefer the more spacious view when running it from DevTools in a browser.',overFlow: TextOverflow.ellipsis,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const IconNTextWidget(
                                    text: 'Normal',
                                    icon: Icons.circle,
                                    textColor: Colors.orange,
                                    iconColor: Colors.orange),
                                SizedBox(
                                  width: dimensionPage.width10,
                                ),
                                IconNTextWidget(
                                    text: '2.5km',
                                    icon: Icons.fmd_good_sharp,
                                    textColor: AppColors.Darkviolet,
                                    iconColor: AppColors.Darkviolet),
                                SizedBox(
                                  width: dimensionPage.width10,
                                ),
                                const IconNTextWidget(
                                    text: '30mn',
                                    icon: Icons.access_time_outlined,
                                    textColor: Colors.red,
                                    iconColor: Colors.red),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

Widget _PageBodyBuildItem(
    int index, double currPageValue, double _height, double _scaleFactor) {
  Matrix4 matrix = Matrix4.identity();
  if (index == currPageValue.floor()) {
    var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
    var currTran = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTran, 0);
  } else if (index == currPageValue.floor() + 1) {
    var currScale =
        _scaleFactor + (currPageValue - index + 1) * (1 - _scaleFactor);
    var currTran = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTran, 0);
  } else if (index == currPageValue.floor() - 1) {
    var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
    var currTran = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTran, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  }
  return Transform(
    transform: matrix,
    child: Stack(children: [
      //header
      Container(
        height: dimensionPage.pageViewContainer,
        margin: EdgeInsets.only(
            left: dimensionPage.width10, right: dimensionPage.width10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dimensionPage.radius30),
            color: Colors.amber,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food10.jpg'))),
      ),
      // slider
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 400,
          height: dimensionPage.pageViewTextContainer,
          margin: EdgeInsets.only(
              left: dimensionPage.width30,
              right: dimensionPage.width30,
              bottom: dimensionPage.height30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimensionPage.radius20),
              color: AppColors.MainWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.LightShadowColor,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(
                  color: AppColors.MainWhite,
                  offset: const Offset(-3, 0),
                ),
                BoxShadow(
                  color: AppColors.MainWhite,
                  offset: const Offset(3, 0),
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                top: dimensionPage.height15,
                left: dimensionPage.width15,
                right: dimensionPage.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: 'Chicken fried'.toUpperCase()),
                SizedBox(
                  height: dimensionPage.height10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: AppColors.Darkviolet,
                                size: 15,
                              )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DiscriptionText(text: '4.5'),
                    const SizedBox(
                      width: 10,
                    ),
                    DiscriptionText(text: '1234'),
                    const SizedBox(
                      width: 5,
                    ),
                    DiscriptionText(text: 'Comments'),
                  ],
                ),
                SizedBox(
                  height: dimensionPage.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconNTextWidget(
                        text: 'Normal',
                        icon: Icons.circle,
                        textColor: Colors.orange,
                        iconColor: Colors.orange),
                    const SizedBox(
                      width: 15,
                    ),
                    IconNTextWidget(
                        text: '2.5km',
                        icon: Icons.fmd_good_sharp,
                        textColor: AppColors.Darkviolet,
                        iconColor: AppColors.Darkviolet),
                    const SizedBox(
                      width: 15,
                    ),
                    const IconNTextWidget(
                        text: '30mn',
                        icon: Icons.access_time_outlined,
                        textColor: Colors.red,
                        iconColor: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]),
  );
}
