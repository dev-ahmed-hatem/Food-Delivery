import 'package:flutter/material.dart';
import 'package:iti_project/views/cart_view.dart';
import 'package:iti_project/views/consts.dart';
import 'custom_menu_bar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "BentonSnas", brightness: Brightness.dark),
      home: Scaffold(
        //backgroundColor: menuBarBackground,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: PageView(
            children: const [
              Stack(children: [
                CartView(),
                Positioned(bottom: 0, left: 0, right: 0, child: CustomMenuBar())
              ])
            ],
          ),
        ),
      ),
    ),
  );
}
