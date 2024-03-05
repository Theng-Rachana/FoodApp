import 'package:food_application/utils/ContantItems.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  // storing data locally
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstant.TOKEN;
    // for everytime we request or sent to server we use header to tell that data as a json
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri, ) async {
    try{
      Response response= await get(uri);
      return response;
    }catch(e){
      return Response( statusCode: 1, statusText: e.toString());
    }
  }
}