class ChatModel {
  final String name;
  final String message;
  final String createdAt;
  final String image;

  ChatModel({
    required this.name,
    required this.message,
    required this.createdAt,
    required this.image,
  });
}

List<Map<String, dynamic>> menu = [
  {
    "image": "assets/images/Menu Photo.png",
    "title": "Herbal Pancake",
    "desc": "Warung Herbal",
    "price": "\$7",
  },
  {
    "image": "assets/Device_images/salad.png",
    "title": "Fruit Salade",
    "desc": "Fruit Salad",
    "price": "\$5",
  },
  {
    "image": "assets/Device_images/green_noodle.png",
    "title": "Green Noodle",
    "desc": "Green Noodle",
    "price": "\$15",
  }
];

List<Map<String, dynamic>> restaurant = [
  {
    "image": "assets/Device_images/vegan.png",
    "title": "Vegan Resto",
    "Time": "12 Min",
  },
  {
    "image": "assets/Device_images/healthy.png",
    "title": "Healthy Food",
    "Time": "8 Min",
  },
  {
    "image": "assets/Device_images/good_food.png",
    "title": "Good Food",
    "Time": "12 Min",
  },
  {
    "image": "assets/Device_images/resto.png",
    "title": "Smart Resto",
    "Time": "8 Min",
  },
];

class MenuModel {
  late String image;
  late String title;
  late String desc;
  late String price;

  MenuModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
  });

  MenuModel.fromJson(Map json) {
    image = json["image"];
    title = json["title"];
    desc = json["desc"];
    price = json["price"];
  }
}

class ResModel {
  String? image;
  String? title;
  String? Time;

  ResModel({
    required this.image,
    required this.title,
    required this.Time,
  });

  ResModel.fromJson(Map json) {
    image = json["image"];
    title = json["title"];
    Time = json["Time"];
  }
}
