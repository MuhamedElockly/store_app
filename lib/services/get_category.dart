import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetCategoryService {
  Future<List<ProductModel>> getCategories({required categoryName}) async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/$categoryName'),
    );

    if (response.statusCode == 200) {
      List<ProductModel> products = [];
      List<dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        products.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return products;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
