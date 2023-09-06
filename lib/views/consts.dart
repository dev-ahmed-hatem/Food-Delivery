import 'package:flutter/material.dart';

import 'chatmodel.dart';

const orange = Color(0xffff7622);
const lightGray = Color(0xff9598a9);
const lightOrange = Color(0xffffe1ce);
const textColor = Color(0xffEAE6F9);

const backgroundColor = Color(0xff2A2C38);
const darkColor = Color(0xff222222);
const themeColor = Color(0xff4023D7);

const notification = Color(0xff4023D7);
const itemsShadow = Color(0xff22242E);

const menuBarBackground = Color(0xff22242e);
const menuBarTextColor = Color(0xff6B50F6);
const menuTextColor = Color(0xff6B50F6);




List<ResModel> resList = restaurant.map((e) => ResModel.fromJson(e)).toList();
List<MenuModel> menuList = menu.map((e) => MenuModel.fromJson(e)).toList();