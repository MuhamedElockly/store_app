class ProductModel {
  final int id;
  final String tittle;
  final int price;
  final String desc;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({required this.id, required this.tittle, required this.price, required this.desc, required this.category, required this.image, required this.ratingModel});
  
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
}
