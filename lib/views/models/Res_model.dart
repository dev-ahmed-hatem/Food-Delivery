

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

  ResModel.fromJson(Map json){
    image = json["image"];
    title = json["title"];
    description = json["description"];
    price= json["price"];



  }
}