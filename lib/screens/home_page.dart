import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 75),
          child: FutureBuilder<List<ProductModel>>(
            future: getAllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  itemBuilder: (context, index) {
                    return CustomCard();
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
