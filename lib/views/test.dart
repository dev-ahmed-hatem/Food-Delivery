import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_project/cubit/cart_cubit.dart';
import 'package:iti_project/models/product_model.dart';
import 'package:iti_project/views/home/cubit/home_cubit.dart';
import 'package:iti_project/views/main_frame.dart';

import '../dio/dio_helper.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("CART_BOX");
  Hive.registerAdapter(ProductModelAdapter());

  DioHelper.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "BentonSnas", brightness: Brightness.dark),
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CartCubit()),
            BlocProvider(create: (context) => HomeCubit())
          ],
          child: const MainFrame()),
    ),
  );
}
