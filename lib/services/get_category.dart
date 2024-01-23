import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetCategoryService {
  Future<List<ProductModel>> getCategories() async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/:category_name'),
    );
    List<ProductModel> products = [];
    List<dynamic> data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      products.add(
        ProductModel.fromJson(data[i]),
      );
    }
  }
}
