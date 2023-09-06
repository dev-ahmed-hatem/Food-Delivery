import 'package:hive/hive.dart';

part 'product_model.g.dart';
@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String imgPath;

  ProductModel(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.imgPath});
}
