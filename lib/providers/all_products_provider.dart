import 'dart:convert';
import 'dart:io';

import 'package:ecom/models/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class AllProductsProvider with ChangeNotifier{

  late List<ProductDetail> _allProductList;
  List<ProductDetail> get wishList => _allProductList;


  int selectedBottomIndex = 0;
  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  Future<List<ProductDetail>> getData() async {
    var response = await http.get(
      Uri.parse(
          "https://abishanchemjong.com.np/ecommerce/api/v1/get-all-products"),
      headers: {
        'api_key': 'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );

    if (response.statusCode == 200) {

        var res = json.decode(response.body.substring(3,response.body.length));
        print("Connected");
        print(res);
        AllProducts allProducts = AllProducts.fromJson(res);
        _allProductList = allProducts.products!;
        // print(allProductList![0].name);
        // print("Product lit = ${allProductList}");
  return _allProductList;
    } else {
      return _allProductList;
      print(response.body);
      print("Not Connected");
    }
  }

}