import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoryService {
  List<dynamic> categories = [];

  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    );
    categories = jsonDecode(response.body);
    return categories;
  }
}
