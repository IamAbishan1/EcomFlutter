import 'dart:convert';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:ecom/controllers/wishlist_controller.dart';
import 'package:ecom/models/model_wishlist.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/providers/wishlist_provider.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/click_button.dart';
import 'package:ecom/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title:Center(
            child: Text("My Wishlist",
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,

              ),),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right:Dimensions.height45),
              child: Center(
                  child: Badge(
                    badgeContent: Text("${wishlist.wishList?.length}",style: TextStyle(
                        color: Colors.white
                    )
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    child: Icon(Icons.favorite),
                  )


              ),
            ),

          ],
          backgroundColor: AppColors.mainColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: wishlist.getData(),
                builder: (context,AsyncSnapshot<List<Products>?> snapshot ){
                  if(snapshot.hasData){
                    return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // itemCount: info[0].length,
                          itemCount: snapshot.data!.length,

                          itemBuilder: (_, i) {
                            return Padding(
                              // padding: EdgeInsets.all(Dimensions.height20),
                              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width45,top: Dimensions.height20,),

                              child: Container(
                                height: 125,
                                decoration: BoxDecoration(
                                  // color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    border: Border.all(color: Colors.black)),
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding:EdgeInsets.only(left: Dimensions.width30,),
                                      child: Container(
                                          height: 100,
                                          width: 65,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(0),
                                              image: DecorationImage(
                                                // image: AssetImage(
                                                //     "assets/image/logo.png")
                                                  image: NetworkImage(
                                                    // allWishList.wishList[i].images[0]
                                                      snapshot.data![i].images.toString().substring(1,snapshot.data![i].images.toString().length-1)
                                                  )
                                              )
                                          )
                                        // child: Image.asset('assets/image/logo.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: Dimensions.height10),
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot.data![i].name.toString(),
                                            style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data![i].price.toString()
                                                ,
                                                style: TextStyle(
                                                    fontSize: Dimensions.font20,
                                                    fontWeight: FontWeight.bold,
                                                    color:Colors.black

                                                ),),
                                              SizedBox(width: Dimensions.width10,),
                                              Text(
                                                snapshot.data![i].discountPrice.toString(),
                                                style: TextStyle(
                                                    fontSize: Dimensions.font20,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.mainColor
                                                ),)
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(Dimensions.height05),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                  border: Border.all(color: Colors.black)),
                                              child: Padding(
                                                padding: EdgeInsets.all(05),
                                                child: Row(
                                                  children: const [
                                                    FaIcon(
                                                      FontAwesomeIcons.shoppingCart,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Add to Cart',
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );

                          }),
                    );
                  }else{
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: AppColors.blueColor,
                      ),
                    );
                  }
                })
          ],
        )


    );

  }
}
