import 'package:flutter/material.dart';
import 'package:iti_project/views/chatmodel.dart';

const avatarImage = "assets/images/Group.png";

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _BuildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 50,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: names.length,
                  itemBuilder: (context, index) => _chatItem(
                    name: names[index].name,
                    message: names[index].message,
                    createdAt: names[index].createdAt,
                    image: names[index].image,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String createdAt,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(34, 36, 46, 1),
      ),
      width: 180,
      height: 90,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       CupertinoIcons.video_camera_solid,
                  //       color: Colors.grey,
                  //     ),
                  //     Text(
                  //       "Video",
                  //       style: TextStyle(
                  //         fontSize: 13,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const Spacer(),
              Text(
                createdAt,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.end,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  AppBar _BuildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF282A35),
      title: Text(
        "Feedbacks",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFFC4C4C4)),
      ),
    );
  }

  List<ChatModel> names = [
    ChatModel(
        name: "Ranim Shabban",
        message: "Amazing as usual",
        createdAt: "12:00PM",
        image: avatarImage),
    ChatModel(
        name: "Ahmed Nabil",
        message: "Deliver at time",
        createdAt: "1:00Am",
        image: avatarImage),
    ChatModel(
        name: "Ahmed Hatem",
        message: "prefecto",
        createdAt: "2:00PM",
        image: avatarImage),
    ChatModel(
        name: "Rokaya Yasser",
        message: "thanks for your service",
        createdAt: "5:00Pm",
        image: avatarImage),
    ChatModel(
        name: "Meran Mamoon",
        message: "Amazing as usual",
        createdAt: "1:00PM",
        image: avatarImage),
    ChatModel(
        name: "Ahmed Allam",
        message: "good service",
        createdAt: "9:00pm",
        image: avatarImage),
  ];
}
