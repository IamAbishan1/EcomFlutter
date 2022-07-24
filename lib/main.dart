import 'dart:convert';

import 'package:ecom/bloc/internet_bloc/internet_bloc.dart';
import 'package:ecom/controllers/all_product_controller.dart';
import 'package:ecom/controllers/wishlist_controller.dart';
import 'package:ecom/models/login_response.dart';
import 'package:ecom/providers/address_provider.dart';
import 'package:ecom/providers/all_products_provider.dart';
import 'package:ecom/providers/cartlist_provider.dart';
import 'package:ecom/providers/category_provider.dart';
import 'package:ecom/providers/order_provider.dart';
import 'package:ecom/providers/single_product_provider.dart';
import 'package:ecom/providers/slider_provider.dart';
import 'package:ecom/providers/wishlist_provider.dart';
import 'package:ecom/screens/address/add_address.dart';
import 'package:ecom/screens/address/addresslist.dart';
import 'package:ecom/screens/cartlist.dart';
import 'package:ecom/screens/category/categorylist.dart';
import 'package:ecom/screens/home.dart';
import 'package:ecom/screens/orders/myorders.dart';
import 'package:ecom/screens/orders/order_successful.dart';
import 'package:ecom/screens/profile.dart';
import 'package:ecom/screens/single_product.dart';
import 'package:ecom/screens/userActivity/register.dart';
import 'package:ecom/screens/userActivity/login.dart';
import 'package:ecom/screens/wishlist.dart';
import 'package:ecom/test.dart';
import 'package:ecom/utils/shared_prefs.dart';
import 'package:ecom/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khalti/khalti.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/category_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  // await Khalti.init(
  //     publicKey: 'test_public_key_db9962f377e546a2bb81cb30ed35b208',
  //     enabledDebugging: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.





  @override
  Widget build(BuildContext context) {


    // Get.find<WishListController>().getWishList();
    // Get.find<AllProductController>().getAllProducts();

    // print(Provider.of<WishListProvider>(context).getData());

    return MultiProvider(
          providers: [
            ChangeNotifierProvider<WishListProvider>(
              create: (context) => WishListProvider(),
            ),
            ChangeNotifierProvider<CategoryProvider>(
                create: (context) => CategoryProvider()
            ),
            ChangeNotifierProvider<AllProductsProvider>(
                create: (context) => AllProductsProvider()
            ),
            ChangeNotifierProvider<SingleProductProvider>(
                create: (context) => SingleProductProvider()
            ),
            ChangeNotifierProvider<CartListProvider>(
                create: (context) => CartListProvider()
            ),
            ChangeNotifierProvider<SliderProvider>(
                create: (context) => SliderProvider()
            ),
            ChangeNotifierProvider<AddressProvider>(
                create: (context) => AddressProvider()
            ),
            ChangeNotifierProvider<OrderProvider>(
                create: (context) => OrderProvider()
            ),

          ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialBinding: dep.InitialBinding(),
        title: 'WearIt ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/login':(context) => LogIn(),
          '/register':(context) => Register(),
          '/home': (context) => Home(),
          '/profile': (context) => UserProfile(),
          // '/singlePage' : (context) => SingleProduct(item);
        },

      ));

  }
}

