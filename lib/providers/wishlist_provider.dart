import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/model_wishlist.dart';
import '../models/product.dart';


class WishListProvider with ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;



  List<Products>? _wishList;
  List<Products>? get wishList => _wishList;


  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  WishListProvider(){
    getData();
  }


 // Future<List<Products>> getData() async{
  Future<List<Products>?> getData() async{

    var response =  await http.get(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/wishlist"),
      headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"},
    );

    if(response.statusCode == 200){

        var res =json.decode(response.body.substring(3,response.body.length));
        // print("Connected");
        // print(res);
        WishListData wishList =WishListData.fromJson(res);
        _wishList = wishList.products!;
        // notifyListeners();
        return _wishList;



    }
    else{
      print(response.body);
      print("Not Connected");
      return _wishList;
    }






    // productsList = json.decode(info[0].toString());

  }

  void _setTotalWishList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('totalWishList', _counter);
    notifyListeners();
  }

  void _getTotalWishList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('totalWishList') ?? 0;
    notifyListeners();
  }

  void addCounter(){
    _counter++;
    _setTotalWishList();
    notifyListeners();
  }

  void removeCounter(){
    _counter--;
    _setTotalWishList();
    notifyListeners();
  }

  int getCounter(){
    _getTotalWishList();
    return _counter;
  }


}