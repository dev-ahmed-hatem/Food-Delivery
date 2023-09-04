import 'package:flutter/material.dart';
import 'package:iti_project/views/cart_view.dart';
import 'package:iti_project/views/home.dart';
import 'package:iti_project/views/profile.dart';
import 'package:iti_project/views/review.dart';
import 'package:iti_project/views/test.dart';
import 'consts.dart';

int currentActivePage = 0;
final List<Widget> pages = [
  HomePage(),
  const CartView(),
  ProfilePage(),
  const ReviewPage()
];

class CustomMenuBar extends StatefulWidget {
  const CustomMenuBar({super.key});

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  List<CustomMenuItem> items = [];

  final List<String> images = [
    "assets/icons/Home.png",
    "assets/icons/Icon Cart.png",
    "assets/icons/Icon Profile.png",
    "assets/icons/Chat.png",
  ];
  final List<String> text = ["Home", "Cart", "Profile", "FeedBack"];

  void buildMenuItems() {
    items.clear();
    for (var i = 0; i < 4; i++) {
      items.add(CustomMenuItem(
        image: images[i],
        text: text[i],
        isActive: currentActivePage == i ? true : false,
        index: i,
        callback: updateMenuBar,
      ));
    }
  }

  @override
  void initState() {
    buildMenuItems();
    super.initState();
  }

  void updateMenuBar() {
    buildMenuItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: 100,
        duration: const Duration(milliseconds: 150),
        decoration: const BoxDecoration(
            color: menuBarBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ));
  }
}

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem(
      {required this.image,
      required this.text,
      required this.isActive,
      required this.index,
      required this.callback,
      super.key});

  final String image;
  final String text;
  final bool isActive;
  final int index;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive
          ? index == 3
              ? 160
              : 135
          : 60,
      height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isActive ? const Color(0xff25243F) : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      duration: const Duration(milliseconds: 150),
      child: InkWell(
        onTap: () {
          currentActivePage = index;
          callback();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => pages[index]));
        },
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Image.asset(
              image,
              height: 30,
              width: 30,
            ),
            if (isActive)
              Visibility(
                  visible: true,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      text,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: const TextStyle(
                          color: menuBarTextColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w500),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
