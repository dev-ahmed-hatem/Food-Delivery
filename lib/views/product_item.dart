import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import 'chatmodel.dart';
import 'consts.dart';
import 'package:iti_project/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final MenuModel menuItem;
  final bool cart;

  const ProductItem({super.key, required this.menuItem, required this.cart});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: menuBarBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                menuItem.image,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4, top: 4),
                    child: Text(
                      menuItem.title,
                      style: const TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  Text(menuItem.desc,
                      style: const TextStyle(color: Colors.grey, fontSize: 15))
                ],
              ),
            )),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(menuItem.price,
                      style: const TextStyle(
                          color: themeColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                ),
                Visibility(
                    visible: !cart,
                    child: InkWell(
                      onTap: () {
                        final cartProduct = MenuModel(
                            title: menuItem.title,
                            desc: menuItem.desc,
                            price: menuItem.price,
                            image: menuItem.image);

                        cubit.addToCart(cartProduct);
                      },
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
