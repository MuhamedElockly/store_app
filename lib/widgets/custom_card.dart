import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  final ProductModel productModel;

  const CustomCard({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10, 10),
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HandBag Lv',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$225',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 80,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
