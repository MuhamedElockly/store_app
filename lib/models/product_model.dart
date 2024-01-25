import 'package:store_app/helper/convert_to_double.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String desc;
  final String category;
  final String image;
  final RatingModel? ratingModel;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.desc,
      required this.category,
      required this.image,
     this.ratingModel});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData['category'],
      id: jsonData['id'],
      desc: jsonData['description'],
      image: jsonData['image'],
      price: ConvertToDouble.checkDouble(jsonData['price']),
      title: jsonData['title'],
      ratingModel: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: ConvertToDouble.checkDouble(jsonData['rate']),
      count: jsonData['count'],
    );
  }
}
