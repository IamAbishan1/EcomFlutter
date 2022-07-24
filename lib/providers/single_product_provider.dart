

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../widgets/snackbar.dart';

class SingleProductProvider with ChangeNotifier{

  int _productCount = 1;
  int get itemCount => _productCount;
  bool isWishedItem = false;

  void restartItemCount(){
    _productCount = 1;
    notifyListeners();

  }

  Future<bool> isWishedListItem(int p_id) async {
    var response = await http.post(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/isWishListItem"),
        headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
        },
        body: {
          'p_id' : '${p_id}'

        });

    var res =json.decode(response.body);
    print(res);
    print("Breaker");
    print(response.statusCode);

    if(response.statusCode == 200){
      // notifyListeners();
      return true;
    }
    else{
      // notifyListeners();
      return false;
    }

  }
  // Future<bool> getBool(int p_id) async {
  //   // late bool? value = false;
  //   // isWishedListItem(p_id).then((result) {
  //   //   print("this is result");
  //   //   print(result);
  //   //   value = result;
  //   // });
  //   // print(value);
  //   // return value!;
  //   bool value = await isWishedListItem(p_id);
  // }

  Future addToCart(int p_id,int itemcount) async {
    if(!isWishedItem){
      //Add to wishlist
      print("Testing wishlits");
      var response = await http.post(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/cart"),
          headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
          },
          body: {
            'p_id' : '${p_id}',
            'quantity' : '${itemCount}'

          });
      print(response);
      var res =json.decode(response.body);
      print(res);

      if(response.statusCode == 200){
        print("Success to cart");
        isWishedItem = true;
      }
      else {
        print("cart not added");

      }

    }
    else{
      isWishedItem = false;
    }
    notifyListeners();

  }

  Future addToWishList(int p_id) async {
    if(!isWishedItem){
      //Add to wishlist
      print("Testing wishlits");
      var response = await http.post(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/wishlist"),
          headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
            },
          body: {
        'p_id' : '${p_id}'

      });
      print(response);
      var res =json.decode(response.body);
      print(res);

      if(response.statusCode == 200){
        print("Success to wishlist");
        isWishedItem = true;
      }
      else {
        print("Wishlist not added");

      }

    }
    else{
      isWishedItem = false;
    }
    notifyListeners();

  }

  bool plusItem(){
    if(_productCount<10){
      _productCount++;
      notifyListeners();
      return true;
    }
    else{
      notifyListeners();
      return false;

    }
  }


  bool minusItem(){
    if(_productCount!=1){
      _productCount--;
      notifyListeners();
      return true;
    }
    else{
      notifyListeners();
      return false;

    }
  }
}