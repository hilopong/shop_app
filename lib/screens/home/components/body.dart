import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  List<Product> prdlist=[];



  Future getprdlist(int catecode) async {
    var result = await http.get(Uri.parse(
        'https://webapi.superdesk.co.kr/AdminProduct/GetPrdList/?companyidx=' +
            catecode.toString()));
    var result2 = jsonDecode(result.body);

    for (var i = 0; i < result2.length; i++) {
      print(result2[i]['NVC_prdName']);

      Product prd = Product(
        id: result2[i]['I_idx'],
        images: [
          "assets/images/ps4_console_white_1.png",
          "assets/images/ps4_console_white_2.png",
          "assets/images/ps4_console_white_3.png",
          "assets/images/ps4_console_white_4.png",
        ],
        colors: [
          Color(0xFFF6625E),
          Color(0xFF836DB8),
          Color(0xFFDECB9C),
          Colors.white,
        ],
        title: result2[i]['NVC_prdName'],
        price: 45.4,
        description: "test",
      );

      prdlist.add(prd);
    }

    print(prdlist[0].title);
  }

  @override
  Widget build(BuildContext context) {
    getprdlist(36);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(prdlist: prdlist),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
