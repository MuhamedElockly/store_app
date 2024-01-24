import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<dynamic> updateProduct(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
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
