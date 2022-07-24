import 'package:ecom/data/api/api_client.dart';
import 'package:get/get.dart';

class WishListRepo extends GetxService{
  final ApiClient apiClient;
  WishListRepo({required this.apiClient});


  Future<Response> getWishList() async{
    return await apiClient.getData("wishlist",'ef0b2072bb1ed96e59c4c97842fa8e67');
  }

}