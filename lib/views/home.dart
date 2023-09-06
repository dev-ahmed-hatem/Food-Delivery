import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/views/consts.dart';
import 'package:iti_project/views/custom_app_bar.dart';
import 'package:iti_project/views/product_item.dart';

import 'home/cubit/home_cubit.dart';
import 'home/models/BannerModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // home bar
            const CustomAppBar(
                title: "Find Your\nFavourite Food",
                trailing: Icon(
                  CupertinoIcons.bell,
                  color: notification,
                )),
            const SizedBox(
              height: 20,
            ),
            // search bar
            Row(children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 13, bottom: 13),
                height: 50,
                decoration: BoxDecoration(
                    color: itemsShadow,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.search),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: 240,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "What do you want to order?",
                              hintStyle: TextStyle(
                                color: lightGray,
                                fontSize: 13,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ]),
              ),
              const Spacer(),
              Container(
                  width: 49,
                  height: 50,
                  decoration: BoxDecoration(
                    color: itemsShadow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                    size: 24,
                  ))
            ]),
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                      // Promo
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeBannerLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is HomeBannerSuccess) {
                            List<BannerData>? rawImages =
                                context.read<HomeCubit>().bannerModel.data;
                            List<BannerData>? images = [
                              rawImages![6],
                              rawImages[7],
                              rawImages[8]
                            ];
                            return SizedBox(
                              width: 342,
                              height: 150,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 400,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.95,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: images.map((item) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        item.image!,
                                        fit: BoxFit.fill,
                                      ));
                                }).toList(),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                      /*Container(
                        width: 342,
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/Promo.png"),
                          fit: BoxFit.fill,
                        )),
                      ),*/
                      const SizedBox(
                        height: 20,
                      ),

                      // Nearest Restaurants
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
                          itemCount: resList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                          itemBuilder: (context, index) => _resItemBuilder(
                              image: resList[index].image ?? "",
                              title: resList[index].title ?? "",
                              time: resList[index].Time ?? ""),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Popular Menu
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

                      /*Container(
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
                  )*/
                    ] +
                    _buildPopularMenu(),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

Widget _menuItemBuilder(
    {required String image,
    required String title,
    required String description,
    required String price}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: itemsShadow, borderRadius: BorderRadius.circular(22)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                fontSize: 17),
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
  );
}

Widget _resItemBuilder({
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

List<Widget> _buildPopularMenu() {
  final List<Widget> items = [];
  for (int i = 0; i < menuList.length; i++) {
    items.add(ProductItem(
      menuItem: menuList[i],
      cart: false,
    ));
  }
  return items;
}
