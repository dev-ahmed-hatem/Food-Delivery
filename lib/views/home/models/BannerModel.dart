class BannerModel {
  BannerModel({
      this.status, 
      this.message, 
      this.data,});

  BannerModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BannerData.fromJson(v));
      });
    }
  }
  bool? status;
  dynamic message;
  List<BannerData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BannerData {
  BannerData({
      this.id, 
      this.image, 
      this.category, 
      this.product,});

  BannerData.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
  num? id;
  String? image;
  dynamic category;
  dynamic product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['category'] = category;
    map['product'] = product;
    return map;
  }

}