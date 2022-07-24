import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  String? api_key;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl,this.api_key}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'api_key':'ef0b2072bb1ed96e59c4c97842fa8e67'
    };
  }

  Future<Response> getData(String uri,String? api_key) async{
    try{
      Response response = await get(uri,headers: {'api_key':'${api_key}'});
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}