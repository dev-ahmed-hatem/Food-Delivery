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

class ResModel {
  String? image;
  String? title;
  String? description;
  String? price;

  ResModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  ResModel.fromJson(Map json) {
    image = json["image"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
  }
}

class MenuModel {
  String? image;
  String? title;
  String? description;
  String? price;

  MenuModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  MenuModel.fromJson(Map json) {
    image = json["image"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
  }
}

List<Map<String, dynamic>> restaurant = [
  {
    "image": "assets/images/1.jpeg",
    "title": "Bacon",
    "price": "\$6",
  },
  {
    "image": "assets/images/2.jpeg",
    "title": "Burger",
    "price": "\$16",
  },
  {
    "image": "assets/images/8.jpeg",
    "title": "Hot Dog",
    "price": "\$15",
  },
  {
    "image": "assets/images/3.jpeg",
    "title": "Cheddar",
    "price": "\$12",
  },
  {
    "image": "assets/images/4.jpeg",
    "title": "American Coffee",
    "price": "\$8",
  },
  {
    "image": "assets/images/5.jpeg",
    "title": "Fries",
    "price": "\$10",
  },
  {
    "image": "assets/images/10.jpeg",
    "title": "Ice Cream",
    "price": "\$5",
  },
];

List<Map<String, dynamic>> menu = [
  {
    "image": "assets/images/7.jpeg",
    "title": "Herbal Pancake",
    "description": "Warung Herbal",
    "price": "\$7",
  },
  {
    "image": "assets/images/11.jpeg",
    "title": "Fruit Salade",
    "description": "Fruit Salad",
    "price": "\$5",
  },
  {
    "image": "assets/images/6.jpeg",
    "title": "Green Noodle",
    "description": "Green Noodle",
    "price": "\$15",
  }
];
