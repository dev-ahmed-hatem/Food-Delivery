import 'package:flutter/material.dart';
import 'consts.dart';

int currentActivePage = 0;

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
  ];
  final List<String> text = ["Home", "Cart", "Profile"];

  void buildMenuItems(){
    items.clear();
    for (var i = 0; i < 3; i++) {
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
      width: isActive ? 160 : 60,
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
                    duration: const Duration(milliseconds: 150),
                    margin: const EdgeInsets.only(left: 20, top: 5),
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