import 'package:ecom/controllers/all_product_controller.dart';
import 'package:ecom/controllers/wishlist_controller.dart';
import 'package:ecom/data/api/api_client.dart';
import 'package:ecom/data/repository/wish_list_repo.dart';
import 'package:ecom/models/all_products.dart';
import 'package:ecom/utils/app_constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controllers/category_controller.dart';
import '../data/repository/all_products_repo.dart';
import '../data/repository/category_repo.dart';


Future<void> init() async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => WishListRepo(apiClient: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => AllProductsRepo(apiClient: Get.find()));



  //controllers
  Get.lazyPut(() => WishListController(wishListRepo: Get.find()),fenix: true);
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AllProductController(allProductsRepo: Get.find()),fenix: true);


}
