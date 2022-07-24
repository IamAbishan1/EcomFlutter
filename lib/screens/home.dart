import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecom/bloc/internet_bloc/internet_bloc.dart';
import 'package:ecom/models/model_wishlist.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/screens/category/categorylist.dart';
import 'package:ecom/screens/home_content.dart';
import 'package:ecom/screens/orders/myorders.dart';
import 'package:ecom/screens/wishlist.dart';
import 'package:ecom/test.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/app_icon.dart';
import 'package:ecom/widgets/category_item.dart';
import 'package:ecom/widgets/nav_button.dart';
import 'package:ecom/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/internet_bloc/internet_state.dart';
import '../utils/shared_prefs.dart';
import 'cartlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  int selectedBottomIndex = 0;

  List<Widget> screens = [
    const HomeContent(),
    const CategoryList(),
    const WishList(),
    const CartList(),
    const MyOrderHistory()
  ];

  List<String> screenName =[
    "Home",
    "Shop by Category",
    "My Wishlist",
    "My Cart",
    "My Order History"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title:Center(
      //     child: Text(screenName[selectedBottomIndex],
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: Dimensions.font26,
      //         fontWeight: FontWeight.bold,
      //
      //       ),),
      //   ),
      //   backgroundColor: AppColors.mainColor,
      // ),

      bottomNavigationBar:
        // BlocConsumer<InternetBloc,InternetState>(
        // listener: (context, state) {
        //   if(state is InternetLostState){
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //       content: Text("Connect to the internet for more actions!"),
        //           backgroundColor: Colors.red,
        //     ));
        //   }
        //
        // },
        // builder: (context, state) {
           BottomNavBar(
              selectedIndex: selectedBottomIndex,
              onBottomChanged: (index) {
                setState(() {
                  selectedBottomIndex = index;
                });
              }),
        // },
        //
        // ),

      body: screens[selectedBottomIndex],
    );


  }
}



