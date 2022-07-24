import 'dart:convert';
import 'dart:io';

import 'package:ecom/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class CartListProvider with ChangeNotifier{
  List<CartProducts>? _cartList;
  List<CartProducts>? get cartList => _cartList;

  int _totalPrice = 0;
  int get allTotal => totalPrice();


  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  CartListProvider(){
    getData();
  }



  Future<List<CartProducts>?> getData() async{
    var response = await http.get(
      Uri.parse(
          "https://abishanchemjong.com.np/ecommerce/api/v1/cart"),
      headers: {
        'api_key': 'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );

    if (response.statusCode == 200) {

      var res = json.decode(response.body.substring(3,response.body.length));
      print("Connected");
      print(res);
      Cart cat = Cart.fromJson(res);
      _cartList = cat.products!;
      // print(categoryList![0].name);
      // print("Product lit = ${categoryList}");
      // notifyListeners();
      return _cartList;


    } else {
      return _cartList;
      print(response.body);
      print("Not Connected");
    }
  }

  int totalPrice(){
    _cartList?.forEach((element) {
      _totalPrice += element.quantity! * (element.price!.toInt());

    });
    return _totalPrice;
  }


}