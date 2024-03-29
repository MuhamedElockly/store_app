import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class ProductPage extends StatefulWidget {
  static String id = 'ProductPage';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductModel? productModel;

  double? price;

  String? title, desc, image;

  @override
  Widget build(BuildContext context) {
    productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    this.price = productModel!.price;
    this.price = productModel!.price;
    this.price = productModel!.price;
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct();
                      showSnackBar(context, 'Success');
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  buttonText: 'Update',
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
      ProductModel(
        id: productModel!.id,
        title: title == null ? productModel!.title : title!,
        price: price == null ? productModel!.price.toDouble() : price!,
        desc: desc == null ? productModel!.desc : desc!,
        category: productModel!.category,
        image: image == null ? productModel!.image : image!,
      ),
    );
  }
}
