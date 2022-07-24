import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/category.dart';

class CategoryProvider with ChangeNotifier{

  late List<Categories> _categoryList;
  List<Categories> get category => _categoryList;


  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';


  Future<List<Categories>> getData() async{
    var response = await http.get(
      Uri.parse(
          "https://abishanchemjong.com.np/ecommerce/api/v1/get-categories"),
      headers: {
        'api_key': 'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );

    if (response.statusCode == 200) {

        var res = json.decode(response.body.substring(3,response.body.length));
        print("Connected");
        print(res);
        Category cat = Category.fromJson(res);
        _categoryList = cat.categories!;
        // print(categoryList![0].name);
        // print("Product lit = ${categoryList}");
      return _categoryList;


    } else {
      return _categoryList;
      print(response.body);
      print("Not Connected");
    }
  }
}