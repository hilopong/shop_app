import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product2 extends Equatable {
  final int I_idx;
  final String NVC_prdName;
  final List<String> NVC_ImgName;
  final int I_discountPrice;

  const Product2({
    required this.I_idx,
    required this.NVC_prdName,
    required this.NVC_ImgName,
    required this.I_discountPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        I_idx,
        NVC_prdName,
        NVC_ImgName,
        I_discountPrice,
      ];
}