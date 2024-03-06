import 'package:food_application/PagesView/SingleProductDetailView/SingleProductDetailView.dart';
import 'package:food_application/PagesView/SingleProductDetailView/SingleProductRecommendDetail.dart';
import 'package:get/get.dart';

import '../PagesView/Cart/CartPage.dart';
import '../PagesView/HomePageView/HomePageVeiw.dart';

class Routes {
  static const String homePage = '/';
  static const String singleProductDetail = '/detail';
  static const String singleProductRecommendDetail = '/detailRecommend';
  static const String cartPage = '/cart';

  static String getHomePage()=> '$homePage';
  static String getSingleProductDetail(int pageIndex)=> '$singleProductDetail?pageId=$pageIndex';
  static String getSingleProductRecommendDetail(int pageIndex)=> '$singleProductRecommendDetail?pageId=$pageIndex';
  static String getCartPage()=> '$cartPage';
  static List<GetPage> pages = [
    GetPage(
      name: homePage,
      page: () => const HomePageView(),
    ),

    GetPage(
      name: singleProductDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        return SingleProductDetailPage(pageId: int.parse(pageId!));
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: singleProductRecommendDetail,
      page: ()  {
        var pageId = Get.parameters['pageId'];
        return RecommendProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}

