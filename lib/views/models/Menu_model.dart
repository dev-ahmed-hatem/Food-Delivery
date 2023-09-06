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

  MenuModel.fromJson(Map json){
    image = json["image"];
    title = json["title"];
    description = json["description"];
    price =json["price"];

  }
}