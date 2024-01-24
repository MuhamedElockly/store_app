import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/Api.dart';

class AllCategoryService {
  List<dynamic> categories = [];

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(uri: 
      'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
