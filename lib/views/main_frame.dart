import 'package:flutter/material.dart';

import 'cart_view.dart';
import 'custom_menu_bar.dart';
import 'home.dart';

int currentActivePage = 0;

List<Widget> pages = [
  const HomePage(),
  const CartView(),
  const Scaffold(),
  const Scaffold()
];

class MainFrame extends StatefulWidget {
  const MainFrame({super.key});

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  PageController mainFrame = PageController(initialPage: 0);
  late CustomMenuBar customMenuBar;

  void _onPageChanged(int index) {
    setState(() {
      currentActivePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
            onPageChanged: _onPageChanged,
            itemCount: pages.length,
            controller: mainFrame,
            itemBuilder: (context, index) {
              return pages[index];
            }),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomMenuBar(mainFrame: mainFrame))
      ]),
    );
  }
}
