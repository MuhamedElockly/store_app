import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class ProductPage extends StatelessWidget {
  ProductModel? productModel;
  static String id = 'ProductPage';
  double? price;
  String? title, desc, image;

  @override
  Widget build(BuildContext context) {
    productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    this.price = productModel!.price;
    this.price = productModel!.price;
    this.price = productModel!.price;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
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
                  price = double.parse(data);
                },
                obscureText: false,
                hintText: 'Price',
                inputType: TextInputType.number,
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
                onTap: () {
                  UpdateProductService().updateProduct(
                    ProductModel(
                      id: productModel!.id,
                      title: this.title!,
                      price: this.price!,
                      desc: this.desc!,
                      category: productModel!.category,
                      image: this.image!,
                    ),
                  );
                },
                buttonText: 'Update',
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
