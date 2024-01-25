import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class ProductPage extends StatelessWidget {
  static String id = 'ProductPage';
  double? price;
  String? title, desc, image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: (data) {
                title = data;
              },
              obscureText: false,
              hintText: 'Product Name',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (data) {
                desc = data;
              },
              obscureText: false,
              hintText: 'Desc',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (data) {
                price = data as double?;
              },
              obscureText: false,
              hintText: 'Price',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (data) {
                image = data;
              },
              obscureText: false,
              hintText: 'Image',
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              buttonText: 'Update',
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
