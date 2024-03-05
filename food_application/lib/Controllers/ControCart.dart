import 'package:food_application/Data/repository/RepoCart.dart';
import 'package:food_application/Models/ProductsModel.dart';
import 'package:food_application/Models/cartModel.dart';
import 'package:get/get.dart';

class ControCart extends GetxController{
  final RepoCart repoCart;
  ControCart({required this.repoCart});
  Map<int , cartModel> _items = {};
  Map<int , cartModel> get items => _items;

  void addItem(ProductsModel product, int quantity) {
    if(quantity>0){
      if(_items.containsKey(product.id)){
        _items.update(product.id!, (value) => cartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          quantity:value.quantity!+quantity,
          img: value.img,
          isExist: true,
          time: DateTime.now().toString(),
        ));
      }
      else{
        _items.putIfAbsent(product.id!, () {
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
      update();
    }
  }
  bool existInCart(ProductsModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductsModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}