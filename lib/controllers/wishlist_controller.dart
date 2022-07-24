import 'package:ecom/data/repository/wish_list_repo.dart';
import 'package:ecom/models/model_wishlist.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/screens/wishlist.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  final WishListRepo wishListRepo;

  WishListController({required this.wishListRepo});

  List<dynamic> _wishList =  [];
  List<dynamic> get wishList => _wishList;

  bool _isloaded = false;
  bool get isLoaded => _isloaded;



  Future<void> getWishList() async{
    Response response = await wishListRepo.getWishList();
    if(response.statusCode == 200){
      print("got wishlist");

      _wishList = [];
      // WishListData wishList = [];
      // List<Products> list = [];
      wishList.addAll(WishListData.fromJson(response.body).products!.toList());
      // list.addAll(WishListData.fromJson(response.body).products!.toList());

      print(wishList);
      print(wishList[0].images[0]);
      _isloaded = true;
      print(_isloaded);
      update();


    }else{
      print("Not connected to the database in the server!!");

    }
  }

}