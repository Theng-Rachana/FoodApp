import 'package:flutter/material.dart';
import 'package:food_application/Controllers/ControProduct.dart';
import 'package:food_application/Controllers/ControProductRecommend.dart';
import 'package:food_application/PagesView//HomePageView/HomePageVeiw.dart';
import 'package:food_application/PagesView/Cart/CartPage.dart';
import 'package:food_application/PagesView/SingleProductDetailView/SingleProductDetailView.dart';
import 'package:food_application/PagesView/SingleProductDetailView/SingleProductRecommendDetail.dart';
import 'package:food_application/Routes/RoutesHelper.dart';
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
    Get.find<ControProduct>().getProductList();
    Get.find<ControProductRecommend>().getProductRecommendList();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      home: HomePageView(),
      getPages: Routes.pages,
      // home: SingleProductDetailPage(),
      // home: RecommendProductDetail(),
      // home: CartPage(),
    );
  }
}
