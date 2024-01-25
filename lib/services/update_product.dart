import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  final String url = 'https://fakestoreapi.com/products/:id';
  Future<dynamic> updateProduct(ProductModel productModel) async {
    Map<String, String> header = {};
    final String url = 'https://fakestoreapi.com/products/${productModel.id}';
    http.Response response = await http.put(
      Uri.parse(url),
      body: {
        'price': productModel.price.toString(),
        'title': productModel.title,
        'desc': productModel.desc,
        'image': productModel.image,
        'category': productModel.category,
        'id': productModel.id.toString(),
      },
      headers: header,
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'Ther is a problem with status code ${response.statusCode} with body ${response.body}',
      );
    }
  }
}
