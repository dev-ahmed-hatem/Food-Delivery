import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/cubit/cart_cubit.dart';
import 'package:iti_project/hive/hive_helper.dart';
import 'package:iti_project/views/consts.dart';
import 'package:iti_project/views/custom_app_bar.dart';
import 'package:iti_project/views/product_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                title: "Cart Items",
                trailing: Image.asset(
                  "assets/icons/Icon Cart.png",
                  width: 40,
                  height: 40,
                )),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recently Added Items",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400)),
                BlocBuilder<CartCubit, CartState>(
                  builder: (BuildContext context, CartState state) {
                    if (HiveHelper.productsList.isNotEmpty) {
                      return InkWell(
                        onTap: () {
                          cubit.removeAllProducts();
                        },
                        child: Container(
                          width: 70,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.redAccent),
                          child: const Center(
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
            const SizedBox(height: 36),
            BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: HiveHelper.productsList.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                            menuItem: HiveHelper.productsList[index],
                            cart: true);
                      }),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
