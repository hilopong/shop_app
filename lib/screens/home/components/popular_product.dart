import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

class PopularProducts extends StatelessWidget {
  List<Product> prdlist = [];

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
    return StatefulWrapper(
      onInit: () {
        getprdlist(36);
      },
      child: Column(
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
          )
        ],
      ),
    );
  }
}

/// 상태 위젯에서 onInit 호출을 제공하는 상태 저장 기능 용 래퍼
class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulWrapper({required this.onInit, required this.child});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
