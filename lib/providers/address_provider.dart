import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/address.dart';
import 'package:http/http.dart' as http;


class AddressProvider with ChangeNotifier{

  late List<Adresses> _addressList;
  List<Adresses> get addressList => _addressList;

  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  // Future<List<Products>> getData() async{
  Future<List<Adresses>> getData() async{

    var response =  await http.get(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/address"),
      headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"},
    );

    if(response.statusCode == 200){

      var res =json.decode(response.body.substring(3,response.body.length));
      // print("Connected");
      // print(res);
      Address address =Address.fromJson(res);
      _addressList = address.adresses!;
      // notifyListeners();
      return _addressList;



    }
    else{
      print(response.body);
      print("Not Connected");
      return _addressList;
    }

  }

}
