import 'package:bloc/bloc.dart';
import 'package:iti_project/views/chatmodel.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:iti_project/models/product_model.dart';
import 'package:iti_project/hive/hive_helper.dart';

part 'cart_state.dart';

// Cubit
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getProducts() async {
    emit(CartLoading());
    try {
      await HiveHelper.getProducts();
      emit(CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  void addToCart(MenuModel product) {
    HiveHelper.addProduct(product);
    emit(CartLoaded());
  }

  void removeAllProducts() {
    HiveHelper.removeAllProducts();
    emit(CartLoaded());
  }
}
