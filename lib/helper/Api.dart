import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class Api {
  Future<List> get(String uri) async {
    http.Response response =
        await http.get(Uri.parse(uri));

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
