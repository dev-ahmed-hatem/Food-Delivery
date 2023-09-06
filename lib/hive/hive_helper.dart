import 'package:hive/hive.dart';
import 'package:iti_project/models/product_model.dart';
import 'package:iti_project/views/chatmodel.dart';

class HiveHelper {
  static const productsBox = "CART_BOX";
  static const productsBoxKey = "CART_BOX_KEY";

  static var myBox = Hive.box(productsBox);
  static List<MenuModel> productsList = [];

  static void addProduct(MenuModel product) async {
    productsList.add(product);
    await myBox.put(productsBoxKey, productsList);
  }

  static Future<void> getProducts() async {
    if (myBox.isNotEmpty) {
      myBox.get(productsBoxKey);
    }
  }

  static void removeProduct(int index) async {
    productsList.removeAt(index);
    await myBox.put(productsBoxKey, productsList);
  }

  static void removeAllProducts() async {
    productsList.clear();
    await myBox.put(productsBoxKey, productsList);
  }
}
