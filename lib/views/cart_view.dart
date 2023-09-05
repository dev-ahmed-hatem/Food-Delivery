import 'package:flutter/material.dart';
import 'consts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
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
            const CartBar(),
            const SizedBox(height: 36),
            const Text("Recently Added Items",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 36),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 13,
                  itemBuilder: (context, index) => const CartItem()),
            )
          ],
        ),
      ),
    );
  }
}

class CartBar extends StatelessWidget {
  const CartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Cart Items",
          style: TextStyle(
              color: textColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: menuBarBackground,
          ),
          width: 53,
          height: 53,
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/icons/Icon Cart.png",
            width: 40,
            height: 40,
          ),
        )
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: menuBarBackground,
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/Menu Photo.png",
              width: 80,
              height: 80,
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
                    margin: const EdgeInsets.only(bottom: 4),
                    child: const Text(
                      "Herbal Pancake",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  const Text("Warung Herbal",
                      style: TextStyle(color: Colors.grey, fontSize: 15))
                ],
              ),
            )),
            const Text("\$7",
                style: TextStyle(
                    color: themeColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }
}
