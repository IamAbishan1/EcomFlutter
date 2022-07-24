// import 'package:ecom/models/login_response.dart';
// import 'package:flutter/cupertino.dart';
//
// class LogInResponseProvider with ChangeNotifier{
//
//   late LogInResponse _userData;
//   LogInResponse get userData => _userData;
//
//
//   String api_key = 'ef0b2072bb1ed96e59c4c97842fa8e67';
//
//
//   Future<List<Categories>> getData() async{
//     var response = await http.get(
//       Uri.parse(
//           "https://abishanchemjong.com.np/ecommerce/api/v1/get-categories"),
//       headers: {
//         'api_key': 'ef0b2072bb1ed96e59c4c97842fa8e67',
//         HttpHeaders.contentTypeHeader: "application/json"
//       },
//     );
//
//     if (response.statusCode == 200) {
//
//       var res = json.decode(response.body);
//       print("Connected");
//       print(res);
//       Category cat = Category.fromJson(res);
//       _categoryList = cat.categories!;
//       // print(categoryList![0].name);
//       // print("Product lit = ${categoryList}");
//       return _categoryList;
//
//
//     } else {
//       return _categoryList;
//       print(response.body);
//       print("Not Connected");
//     }
//   }
// }