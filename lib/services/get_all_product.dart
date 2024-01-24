import 'dart:convert';

import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class getAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(uri: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(
          data[i],
        ),
      );
    }
    return productList;
  }
}
