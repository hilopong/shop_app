import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../components/ProductCard2.dart';
import '../../../models/product_model.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Product2>> getprdlist(int catecode) async {
      var result = await http.get(Uri.parse(
          'https://webapi.superdesk.co.kr/AdminProduct/GetPrdList/?companyidx=' +
              catecode.toString()));
      var result2 = jsonDecode(result.body);

      List<Product2> retdata = [];

      for (int i = 0; i < result2.length; i++) {
        // print(result2[i]['NVC_prdName']);
        Product2 prdval = Product2(
            I_idx: result2[i]['I_idx'],
            NVC_prdName: result2[i]['NVC_prdName'],
            NVC_ImgName: [
              "https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/" +
                  result2[i]['NVC_ImgName'],
              "https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/" +
                  result2[i]['NVC_ImgName_sub01'],
              "https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/" +
                  result2[i]['NVC_ImgName_sub02'],
            ],
            I_discountPrice: result2[i]['I_discountPrice']);
        retdata.add(prdval);
      }

      return retdata;
    }

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
                future: getprdlist(22),
                builder: (context, AsyncSnapshot<List<Product2>> snapshot) {
                  // if(snapshot.connectionState==ConnectionState.waiting){
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        ...List.generate(
                          snapshot.data!.length,
                          (index) {
                            return ProductCard2(
                                product2: snapshot.data![index]);
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }))
      ],
    );
  }
}
