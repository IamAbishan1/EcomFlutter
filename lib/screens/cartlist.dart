import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:ecom/models/cart.dart';
import 'package:ecom/screens/orders/order_process.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/cartlist_provider.dart';
import '../providers/order_provider.dart';
import '../widgets/expandable_text.dart';


class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartListProvider>(context);
    final order = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("My Cart",
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
                  badgeContent: Text("${cart.cartList?.length}",style: TextStyle(
                      color: Colors.white
                  )
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_cart),
                )


            ),
          ),

        ],
        backgroundColor: AppColors.mainColor,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimensions.height05),
        child: Container(
          height: Dimensions.height80,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderProcess()));

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(
                  // 'Grand Total: ${cart.totalPrice()}',
                  "8989",
                  style: TextStyle(fontSize: 16),
                ),
                  SizedBox(width: Dimensions.width20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [

                      FaIcon(
                        FontAwesomeIcons.shoppingBag,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Make Order',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context,AsyncSnapshot<List<CartProducts>?> snapshot){
                if(snapshot.hasData){
                  return Expanded(
                    child: ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, _) => SizedBox(
                          height: Dimensions.height20,
                        ),
                        itemBuilder: (_, i) {
                          return Padding(
                            // padding: EdgeInsets.all(Dimensions.height20),
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width20,top: Dimensions.height20,),

                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                // color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: EdgeInsets.only(left:Dimensions.height20),
                                child: Row(
                                  children: [
                                    Container(
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
                                    SizedBox(
                                      width: Dimensions.width20,
                                    ),
                                    Padding(
                                      padding:EdgeInsets.all(Dimensions.height20),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                                child: ExpandableText(
                                                    text: snapshot.data![i].name.toString())
                                            ),
                                          ),
                                          // SingleChildScrollView(
                                          //   child: Text(
                                          //     snapshot.data![i].name.toString(),
                                          //     style: TextStyle(
                                          //         fontSize: Dimensions.font16,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ),
                                          SizedBox(height: Dimensions.height10,),
                                          Row(
                                            children: [
                                              Text(snapshot.data![i].discountPrice.toString(),
                                                style: TextStyle(
                                                  fontSize: Dimensions.font20,
                                                  fontWeight: FontWeight.bold,
                                                  color:Colors.black,
                                                  decoration: TextDecoration.lineThrough,


                                                ),),
                                              SizedBox(width: Dimensions.width10,),
                                              Text(snapshot.data![i].price.toString(),
                                                style: TextStyle(
                                                    fontSize: Dimensions.font20,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.mainColor
                                                ),)
                                            ],
                                          ),
                                          SizedBox(height: Dimensions.height10,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.minus,
                                                size: 20,
                                              ),
                                              SizedBox(width: Dimensions.width10,),
                                              Text(snapshot.data![i].quantity.toString(),
                                                style: TextStyle(
                                                    fontSize: Dimensions.font20,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.mainColor
                                                ),),
                                              SizedBox(width: Dimensions.width10,),
                                              FaIcon(
                                                FontAwesomeIcons.plus,
                                                size: 15,
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );

                        }),
                  );
                }
                else{
                  return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: AppColors.blueColor,
                    ),
                  );
                }
              })
        ],
      ),


    );

  }
}

