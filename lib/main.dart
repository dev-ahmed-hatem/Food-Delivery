import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_project/views/onboarding_view.dart';
import 'dio/dio_helper.dart';
import 'models/product_model.dart';
import 'views/splash_view.dart';
import 'views/test.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("CART_BOX");
  Hive.registerAdapter(ProductModelAdapter());

  DioHelper.init();
  runApp(MaterialApp(
    title: "Food Delivery",
    theme: ThemeData(fontFamily: "BentonSnas"),
    debugShowCheckedModeBanner: false,
    home: const MainView(),
  ));
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        _controller.nextPage(
            duration: const Duration(milliseconds: 700), curve: Curves.ease));
    super.initState();
  }

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: const [SplashView(), OnboardingView()],
      );
}
