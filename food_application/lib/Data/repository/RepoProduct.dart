import 'package:food_application/Data/Apis/ApiClient.dart';
import 'package:food_application/utils/ContantItems.dart';
import 'package:get/get.dart';

class RepoProduct extends GetxService{
  late final ApiClient apiClient;
  RepoProduct({ required this.apiClient });
  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.PRODUCTS_END_POINT_URL);
  }

}