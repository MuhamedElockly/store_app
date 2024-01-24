import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class Api {
  Future<List> get({required uri, @required String? token}) async {

     Map<String, String> header = {};
    if (token != null) {
      header.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    http.Response response = await http.get(Uri.parse(uri),headers: header);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productList = [];
      return data;
    } else {
      throw Exception(
        'ther is a problem ${response.statusCode}',
      );
    }
  }

}
