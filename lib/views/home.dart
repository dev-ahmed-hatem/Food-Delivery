import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iti_project/views/chatmodel.dart';
import 'package:iti_project/views/consts.dart';
import 'package:iti_project/views/custom_menu_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 60),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Find Your\nFavourite Food",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: textColor,
                                fontFamily: "SenBold"),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 60),
                            child: Container(
                                //padding: EdgeInsets.only(left: 9),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: itemsShadow,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const SizedBox(
                                  child: Icon(
                                    CupertinoIcons.bell,
                                    color: notification,
                                  ),
                                )),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Container(
                        width: 270,
                        height: 50,
                        decoration: BoxDecoration(
                            color: itemsShadow,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 13, bottom: 13),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(CupertinoIcons.search),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "What do you want to order?",
                                        hintStyle: TextStyle(
                                          color: lightGray,
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                            width: 49,
                            height: 50,
                            decoration: BoxDecoration(
                              color: itemsShadow,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                            )),
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 342,
                          height: 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/Device_images/Promo.png"),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(children: [
                      Text(
                        "Nearest Restaurants",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: textColor,
                            fontFamily: "SenBold"),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: Text(
                          "View More",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.green,
                              fontFamily: "SenBold"),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: ResList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemBuilder: (context, index) => _ResItemBuilder(
                            image: ResList[index].image ?? "",
                            title: ResList[index].title ?? "",
                            time: ResList[index].Time ?? ""),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(children: [
                      Text(
                        "Popular Menu",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: textColor,
                            fontFamily: "SenBold"),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: Text(
                          "View More",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.green,
                              fontFamily: "SenBold"),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      height: 150,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: MenuList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemBuilder: (context, index) => _MenuItemBuilder(
                          price: MenuList[index].price ?? "",
                          description: MenuList[index].description ?? "",
                          image: MenuList[index].image ?? "",
                          title: MenuList[index].title ?? "",
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget _MenuItemBuilder(
    {required String image,
    required String title,
    required String description,
    required String price}) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: itemsShadow, borderRadius: BorderRadius.circular(22)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 2,
          ),
          Column(children: [
            Text(
              title,
              style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: "SenBold",
                  fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontFamily: "SenBold",
                  fontSize: 14),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              price,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontFamily: "SenBold",
                  fontSize: 22),
            ),
          ]),
        ],
      ),
    ),
  );
}

Widget _ResItemBuilder({
  required String image,
  required String title,
  required String time,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 20),
    height: 170,
    width: 147,
    decoration: BoxDecoration(
        color: itemsShadow, borderRadius: BorderRadius.circular(22)),
    child: Column(
      children: [
        SizedBox(
          width: 96,
          height: 73,
          child: Image.asset(image),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontFamily: "SenBold",
              fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          time,
          style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w900,
              fontFamily: "SenBold",
              fontSize: 13),
        ),
      ],
    ),
  );
}

List<ResModel> ResList = restaurant.map((e) => ResModel.fromJson(e)).toList();
List<MenuModel> MenuList = menu.map((e) => MenuModel.fromJson(e)).toList();
