import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:ecom/models/order.dart';
import 'package:ecom/providers/order_provider.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyOrderHistory extends StatelessWidget {
  const MyOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("My Order",
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
                  badgeContent: Text("${order.orderList?.length}",style: TextStyle(
                      color: Colors.white
                  )
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.history),
                )


            ),
          ),

        ],
        backgroundColor: AppColors.mainColor,
      ),


      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: order.getData(),
              builder: (context,AsyncSnapshot<List<OrderHistory>?> snapshot ){
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
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width45,top: Dimensions.height20,),

                            child: Container(
                              height: 160,
                              decoration: BoxDecoration(
                                // color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  border: Border.all(color: Colors.black)),
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
                                                  snapshot.data![i].bag![0].product!.images.toString().substring(1,snapshot.data![i].bag![0].product!.images.toString().length-1)
                                                // snapshot.data![i].images.toString().substring(1,snapshot.data![i].images.toString().length-1)
                                              )
                                          )
                                      )
                                    // child: Image.asset('assets/image/logo.png'),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Dimensions.height10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Order Id: ${snapshot.data![i].id}",
                                          style: TextStyle(
                                              fontSize: Dimensions.font20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width20,
                                        ),
                                        Text(
                                          "No. of Ordered items: ${snapshot.data!.length}",
                                          style: TextStyle(
                                              fontSize: Dimensions.font20,
                                              fontWeight: FontWeight.bold),
                                        ),SizedBox(
                                          width: Dimensions.width20,
                                        ),
                                        Text(
                                          "Total: Rs 23434",
                                          style: TextStyle(
                                              fontSize: Dimensions.font20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(Dimensions.height05),
                                          child: Container(
                                            height: Dimensions.height45,
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                border: Border.all(color: Colors.black)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'View Details',
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );

                        }),
                  );
                }
                else{
                  return Center(

                    child: CircularProgressIndicator(
                      color: AppColors.blueColor,
                    ),
                  );
                }
              }

          )
        ],
      ),


    );

  }
}


