import 'package:flutter/material.dart';
import 'package:iti_project/views/consts.dart';
import 'custom_menu_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: menuBarBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [CustomMenuBar()],
      ),
    ),
  ));
}
