import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> prdlist;

  const PopularProducts({Key? key, required this.prdlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(title: "Popular Products", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  demoProducts.length,
                      (index) {
                    if (demoProducts[index].isPopular)
                      return ProductCard(product: demoProducts[index]);

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
          //SizedBox(height: getProportionateScreenWidth(20)),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: getProportionateScreenWidth(20)),
          //   child: SectionTitle(title: "Remote Products", press: () {}),
          // ),
          ListView.builder(
              itemCount: prdlist.length,
              itemBuilder: (context,index){
                return SizedBox(
                  child: Text(
                    prdlist[index].title,
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                );
              }
          )
        ],
    );
  }
}
