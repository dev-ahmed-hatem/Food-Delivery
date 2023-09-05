import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/views/chatmodel.dart';
import 'package:iti_project/views/consts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        padding: EdgeInsets.only(left: 20, top: 13, bottom: 13),
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
                          image: AssetImage("assets/images/promo.jpeg"),
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
                      "Food Items Menu",
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
                            color: viewMore,
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
                        price: ResList[index].price ?? "",
                        image: ResList[index].image ?? "",
                        title: ResList[index].title ?? "",
                      ),
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
                            color: viewMore,
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
                      scrollDirection: Axis.vertical,
                      itemCount: MenuList.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemBuilder: (context, index) => _MenuItemBuilder(
                          image: MenuList[index].image ?? "",
                          title: MenuList[index].title ?? "",
                          description: MenuList[index].description ?? "where",
                          price: MenuList[index].price ?? ""),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _MenuItemBuilder(
      {required String image,
      required String title,
      required String description,
      required String price}) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: 100,
        width: 320,
        decoration: BoxDecoration(
            color: itemsShadow, borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 64,
                  height: 64,
                  child: Image.asset(image),
                ),
              ),
              SizedBox(
                width: 10,
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
              ]),
              Spacer(),
              Text(
                price,
                style: TextStyle(
                    color: viewMore,
                    fontWeight: FontWeight.w900,
                    fontFamily: "SenBold",
                    fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ResItemBuilder({
    required String image,
    required String title,
    required String price,
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                price,
                style: TextStyle(
                    color: viewMore,
                    fontWeight: FontWeight.w900,
                    fontFamily: "SenBold",
                    fontSize: 22),
              ),
              Spacer(),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  List<ResModel> ResList = restaurant.map((e) => ResModel.fromJson(e)).toList();
  List<MenuModel> MenuList = menu.map((e) => MenuModel.fromJson(e)).toList();
}
