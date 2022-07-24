import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/slider.dart';


class SliderProvider with ChangeNotifier{

  late List<Sliders> _sliderList;
  List<Sliders> get sliderList => _sliderList;


  String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';

  // Future<List<Products>> getData() async{
  Future<List<Sliders>> getData() async{

    var response =  await http.get(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/slider"),
      headers: {'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67',
        HttpHeaders.contentTypeHeader: "application/json"},
    );

    if(response.statusCode == 200){

      var res =json.decode(response.body.substring(3,response.body.length));
      // print("Connected");
      // print(res);
      Slider slider =Slider.fromJson(res);
      _sliderList = slider.sliders!;
      // notifyListeners();
      return _sliderList;



    }
    else{
      print(response.body);
      print("Not Connected");
      return _sliderList;
    }

  }
}