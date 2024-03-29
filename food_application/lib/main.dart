import 'package:flutter/material.dart';
import 'package:food_application/PagesView//HomePageView/HomePageVeiw.dart';
import 'package:food_application/PagesView/SingleProductDetailView/SingleProductDetailView.dart';
import 'package:food_application/PagesView/SingleProductDetailView/SingleProductRecommendDetail.dart';
import 'package:get/get.dart';
import 'package:food_application/Helper/Depandencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePageView(),
      // home: SingleProductDetailPage(),
      home: RecommendProductDetail(),
    );
  }
}
