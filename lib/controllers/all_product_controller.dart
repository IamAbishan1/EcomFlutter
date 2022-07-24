import 'package:ecom/data/repository/all_products_repo.dart';
import 'package:ecom/models/all_products.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController{

  final AllProductsRepo allProductsRepo;

  AllProductController({required this.allProductsRepo});

  List<ProductDetail> _allProductList =  [];
  List<ProductDetail> get allProductList => _allProductList;

  bool _isloaded = false;
  bool get isLoaded => _isloaded;

  Future<List> getAllProducts() async {
    Response response = await allProductsRepo.getEveryProducts();
    if (response.statusCode == 200) {
      print("Connected");
      _allProductList = [];
      // WishListData wishList = [];
      // List<Products> list = [];
      allProductList.addAll(AllProducts
          .fromJson(response.body)
          .products!
          .toList());
      // list.addAll(WishListData.fromJson(response.body).products!.toList());
      print(allProductList);
      return allProductList;
      print(allProductList[0].name);
      _isloaded = true;

      update();
    } else {
      print("Not connecte to the server");
      return allProductList;
    }
  }

}
