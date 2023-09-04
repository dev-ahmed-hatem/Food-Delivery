import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/views/chatmodel.dart';
import 'package:iti_project/views/consts.dart';
import 'package:iti_project/views/custom_menu_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(left: 30, top: 60),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find Your\nFavourite Food",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: textColor,
                                fontFamily: "SenBold"),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 60),
                            child: Container(
                                //padding: EdgeInsets.only(left: 9),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: itemsShadow,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                  child: Icon(
                                    CupertinoIcons.bell,
                                    color: notification,
                                  ),
                                )),
                          ),
                        ]),
                    SizedBox(
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
                          padding:
                              EdgeInsets.only(left: 20, top: 13, bottom: 13),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.search),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 50,
                                  width: 200,
                                  child: TextFormField(
                                    decoration: InputDecoration(
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
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                            width: 49,
                            height: 50,
                            decoration: BoxDecoration(
                              color: itemsShadow,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: Colors.white,
                            )),
                      )
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 342,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/Device_images/Promo.png"),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        "Nearest Restaurants",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: textColor,
                            fontFamily: "SenBold"),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          "View More",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.green,
                              fontFamily: "SenBold"),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 180,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: ResList.length,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                        itemBuilder: (context, index) => _ResItemBuilder(
                            image: ResList[index].image ?? "",
                            title: ResList[index].title ?? "",
                            Time: ResList[index].Time ?? ""),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        "Popular Menu",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: textColor,
                            fontFamily: "SenBold"),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          "View More",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.green,
                              fontFamily: "SenBold"),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      height: 150,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: MenuList.length,
                        separatorBuilder: (context, index) => SizedBox(
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
        Positioned(bottom: 0, left: 0, right: 0, child: CustomMenuBar())
      ]),
    );
  }

  Widget _MenuItemBuilder(
      {required String image,
      required String title,
      required String description,
      required String price}) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: itemsShadow, borderRadius: BorderRadius.circular(22)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              child: Image.asset(image),
            ),
            SizedBox(
              width: 2,
            ),
            Column(children: [
              Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                    fontFamily: "SenBold",
                    fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                    fontFamily: "SenBold",
                    fontSize: 14),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                price,
                style: TextStyle(
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
    required String Time,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 170,
      width: 147,
      decoration: BoxDecoration(
          color: itemsShadow, borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Container(
            width: 96,
            height: 73,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontFamily: "SenBold",
                fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            Time,
            style: TextStyle(
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
}
