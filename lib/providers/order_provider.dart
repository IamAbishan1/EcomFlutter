import 'dart:convert';
import 'dart:io';

import 'package:ecom/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class OrderProvider with ChangeNotifier{

  List<OrderHistory>? _orderList;
  List<OrderHistory>? get orderList => _orderList;


  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  // Future<List<Products>> getData() async{
  Future<List<OrderHistory>?> getData() async{

    var response =  await http.get(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/order"),
      headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"},
    );

    if(response.statusCode == 200){

      var res =json.decode(response.body.substring(3,response.body.length));
      // print("Connected");
      // print(res);
      Order order =Order.fromJson(res);
      _orderList = order.orderHistory!;
      print("order");
      print(_orderList);
       // notifyListeners();
      return _orderList;



    }
    else{
      print(response.body);
      print("Not Connected");
      return _orderList;
    }

  }
}