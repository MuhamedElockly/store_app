import 'dart:convert';

import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetCategoryService {
  Future<List<ProductModel>> getCategories({required categoryName}) async {
    List<dynamic> data = await Api().get(uri:
      'https://fakestoreapi.com/products/category/$categoryName',
    );
    List<ProductModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return products;
  }
}
