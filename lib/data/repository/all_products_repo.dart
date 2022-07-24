import 'package:ecom/data/api/api_client.dart';
import 'package:get/get.dart';

class AllProductsRepo extends GetxService{
  final ApiClient apiClient;
  AllProductsRepo({required this.apiClient});

  Future<Response> getEveryProducts() async{
    return await apiClient.getData("get-all-products","");
  }

}