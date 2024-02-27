import 'package:food_application/Data/repository/RepoCart.dart';
import 'package:food_application/Models/ProductsModel.dart';
import 'package:food_application/Models/cartModel.dart';
import 'package:get/get.dart';

class ControCart extends GetxController{
  final RepoCart repoCart;
  ControCart({required this.repoCart});
  Map<int , cartModel> _item = {};

  void addItem(ProductsModel product, int quantity) {
    // print("length"+_item.length.toString());
    _item.putIfAbsent(product.id!, () {
      print("added"+product.id.toString()+"quantity"+quantity.toString());
      _item.forEach((key, value) { 
          print("quantity is "+ value.quantity.toString());
      });
      return cartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: quantity,
        img: product.img,
        isExist: true,
        time: DateTime.now().toString(),
      );
    });
  }
}