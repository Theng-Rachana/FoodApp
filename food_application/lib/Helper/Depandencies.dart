import 'package:food_application/Controllers/ControCart.dart';
import 'package:food_application/Controllers/ControProduct.dart';
import 'package:food_application/Controllers/ControProductRecommend.dart';
import 'package:food_application/Data/Apis/ApiClient.dart';
import 'package:food_application/Data/repository/RepoCart.dart';
import 'package:food_application/Data/repository/RepoProduct.dart';
import 'package:food_application/Data/repository/RepoProductRecommend.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  // Repositories
  Get.lazyPut(() => RepoProduct(apiClient: Get.find()));
  Get.lazyPut(() => RepoProductRecommend(apiClient: Get.find()));
  Get.lazyPut(() => RepoCart());

  // Controllers
  Get.lazyPut(() => ControProduct(repoProduct: Get.find()));
  Get.lazyPut(() => ControProductRecommend(repoProductRecommend: Get.find()));
  Get.put(ControCart(repoCart: Get.find())); // Change Get.lazyPut to Get.put for ControCart
}
