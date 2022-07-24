import 'package:ecom/data/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';

class CategoryRepo extends GetxController{

  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});

  Future<Response> getCategories() async{
    return await apiClient.getData("get-categories","");
  }
}