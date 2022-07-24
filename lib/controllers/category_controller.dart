import 'package:ecom/data/repository/category_repo.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class CategoryController extends GetxController{
  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});

  List<Categories> _categoryList =  [];
  List<Categories> get categoryList => _categoryList;

  bool _isloaded = false;
  bool get isLoaded => _isloaded;


  Future<List> getCategoryList() async {
    Response response = await categoryRepo.getCategories();
    if (response.statusCode == 200) {
      print("Connected");
      _categoryList = [];
      // WishListData wishList = [];
      // List<Products> list = [];
      categoryList.addAll(Category
          .fromJson(response.body)
          .categories!
          .toList());
      // list.addAll(WishListData.fromJson(response.body).products!.toList());
      print(categoryList);
      return categoryList;
      print(categoryList[0].name);
      _isloaded = true;

      update();
    } else {
        print("Not connecte to the server");
        return categoryList;
    }
  }
}