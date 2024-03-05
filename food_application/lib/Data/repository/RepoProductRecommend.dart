import 'package:food_application/Data/Apis/ApiClient.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:get/get.dart';

class RepoProductRecommend extends GetxService{
  late final ApiClient apiClient;
  RepoProductRecommend({ required this.apiClient });
  Future<Response> getProductRecommendList() async {
    return await apiClient.getData(AppConstant.RECOMMEND_PRODUCTS_END_POINT_URL);
  }

}