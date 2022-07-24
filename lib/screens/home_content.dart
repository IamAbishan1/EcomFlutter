import 'dart:convert';
import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecom/controllers/all_product_controller.dart';
import 'package:ecom/models/model_wishlist.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/providers/single_product_provider.dart';
import 'package:ecom/screens/single_product.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../controllers/category_controller.dart';
import '../models/all_products.dart';
import '../models/category.dart';
import 'package:http/http.dart' as http;

import '../providers/all_products_provider.dart';
import '../providers/category_provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    final category = Provider.of<CategoryProvider>(context);
    final allProducts = Provider.of<AllProductsProvider>(context);


    return Scaffold(
        appBar: AppBar(
          title:Center(
            child: Text("Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,

              ),),
          ),
          backgroundColor: AppColors.mainColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimensions.height10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Hello! Abishan",
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Text(
                                "Let's find the best products for you",
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                         
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.grey.shade800,
                              backgroundImage: NetworkImage(
                                "https://i.mydramalist.com/vK4lp_5f.jpg",
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.height05),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.search,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search for products',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width45,
                        ),
                        child: SizedBox(
                          height: 140,
                          width: double.infinity,
                          child: Carousel(
                            images: [
                              NetworkImage("https://abishanchemjong.com.np/ecommerce/public/slider_images/2022/03/034617pepsi.jpg"),
                              NetworkImage("https://abishanchemjong.com.np/ecommerce/public/slider_images/2022/05/111903FashionStore.jpg"),
                              NetworkImage("https://abishanchemjong.com.np/ecommerce/public/slider_images/2022/03/034617pepsi.jpg"),
                              NetworkImage("https://abishanchemjong.com.np/ecommerce/public/slider_images/2022/05/111057Hotel Himalaya.jpg")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainColor),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      Column(
                        children: [
                          FutureBuilder(
                              future: category.getData(),
                              builder: (context,AsyncSnapshot<List<Categories>> snapshot ){
                                if(snapshot.hasData){
                                  return  SizedBox(
                                    height: 60,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  // child: Container(
                                                  //     width: 50,
                                                  //     height: 50,
                                                  //     decoration: BoxDecoration(
                                                  //         borderRadius: BorderRadius.circular(
                                                  //             Dimensions.radius20),
                                                  //         image: DecorationImage(
                                                  //           // image: AssetImage(
                                                  //           //     "assets/image/logo.png")
                                                  //             image: NetworkImage(
                                                  //                 category.categoryList[index].categoryImage.toString(),
                                                  //
                                                  //              )
                                                  //         )
                                                  //         )),
                                                  radius: 18,
                                                  backgroundImage: NetworkImage(
                                                    snapshot.data![index]
                                                        .categoryImage
                                                        .toString(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                Text(
                                                  // info[index]['name'],
                                                  // categories![index].name.toString(),
                                                  snapshot.data![index].name.toString(),
                                                  style: TextStyle(
                                                      fontSize: Dimensions.font20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  );
                                }
                                else{
                                  return CircularProgressIndicator(
                                    color: AppColors.blueColor,
                                  );

                                }
                              }
                          )
                        ],
                      ),


                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Just For You ",
                          style: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainColor),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      //###########
                      Column(
                        children: [
                          FutureBuilder(
                              future:allProducts.getData(),
                              builder: (context,AsyncSnapshot<List<ProductDetail>> snapshot){
                                if(snapshot.hasData){
                                  return SingleChildScrollView(
                                    child: SizedBox(
                                      height: 150,
                                      child: ListView.builder(
                                        // itemCount: (info.length.toDouble() / 2).toInt(),
                                          itemCount: snapshot.data!.length,


                                          //   itemCount: (snapshot.data!.length.toDouble() / 2).toInt(),
                                          itemBuilder: (context, i) {


                                            return Padding(
                                              // padding: EdgeInsets.all(Dimensions.height20),
                                              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10,),

                                              child: InkWell(
                                                onTap: (){
                                                  print(snapshot.data![i]);
                                                  ProductDetail item = snapshot.data![i];
                                                  print(item.name);
                                                  Future<bool> isWishedItem = Provider.of<SingleProductProvider>(context,listen: false).isWishedListItem(snapshot.data![i].id!);
                                                  // bool isWishedItem = Provider.of<SingleProductProvider>(context,listen: false).getBool(snapshot.data![i].id!);

                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProduct(item:item,isWisheditem: isWishedItem)));
                                                  Provider.of<SingleProductProvider>(context,listen: false).restartItemCount();


                                                },
                                                child: Container(
                                                  height: 120,
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
                                                            height: 80,
                                                            width: 60,
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
                                                            Flexible(
                                                              child: Text(
                                                                // productsList![i].name! == null?"No vlue":productsList![i].name!,
                                                                // info[0][i]['name'],
                                                                snapshot.data![i].name.toString(),
                                                                style: TextStyle(
                                                                    fontSize: Dimensions.font16,
                                                                    fontWeight: FontWeight.bold,
                                                                    overflow: TextOverflow.visible),
                                                              ),
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

                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
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
                      )






                      //###############
                      //   // child: GetBuilder<AllProductController>(builder: (allProducts){
                      //   //
                      //   //   return ListView.builder(
                      //   //     // itemCount: (info.length.toDouble() / 2).toInt(),
                      //   //       itemCount: allProducts.allProductList.length,
                      //   //       itemBuilder: (context, i) {
                      //   //         int a = 2 * i;
                      //   //         int b = 2 * i + 1;
                      //   //         return Row(
                      //   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   //           children: [
                      //   //             Padding(
                      //   //               padding: EdgeInsets.only(
                      //   //                   left: Dimensions.width20,
                      //   //                   right: Dimensions.width20,
                      //   //                   top: Dimensions.height20,
                      //   //                   bottom: Dimensions.height20),
                      //   //               // padding: EdgeInsets.all(Dimensions.height20),
                      //   //
                      //   //               child: Column(
                      //   //                 children: [
                      //   //                   Material(
                      //   //                     child: InkWell(
                      //   //                       child: Container(
                      //   //                         width: 120,
                      //   //                         height: 160,
                      //   //                         decoration: BoxDecoration(
                      //   //                             color: Colors.white,
                      //   //                             borderRadius:
                      //   //                             BorderRadius.circular(
                      //   //                                 Dimensions.radius15),
                      //   //                             image: DecorationImage(
                      //   //                                 image: AssetImage(
                      //   //                                     'assets/image/logo.png')),
                      //   //                             boxShadow: [
                      //   //                               BoxShadow(
                      //   //                                 blurRadius: 3,
                      //   //                                 offset: Offset(5, 5),
                      //   //                                 color: AppColors.paraColor
                      //   //                                     .withOpacity(0.1),
                      //   //                               ),
                      //   //                               BoxShadow(
                      //   //                                 blurRadius: 3,
                      //   //                                 offset: Offset(-5, -5),
                      //   //                                 color: AppColors.paraColor
                      //   //                                     .withOpacity(0.1),
                      //   //                               )
                      //   //                             ]),
                      //   //                       ),
                      //   //                       onTap: () => Navigator.push(
                      //   //                           context,
                      //   //                           MaterialPageRoute(
                      //   //                               builder: (context) =>
                      //   //                                   SingleProduct(
                      //   //                                       item: items[i]))),
                      //   //                     ),
                      //   //                   ),
                      //   //                   Center(
                      //   //                     child: Align(
                      //   //                         alignment: Alignment.bottomCenter,
                      //   //                         child: Text(
                      //   //                           // info[a]['name']
                      //   //                             allProducts.allProductList[i].name.toString()
                      //   //                         )),
                      //   //                   )
                      //   //                 ],
                      //   //               ),
                      //   //             ),
                      //   //             Padding(
                      //   //               // padding: EdgeInsets.all(Dimensions.height20),
                      //   //               padding: EdgeInsets.only(
                      //   //                 left: Dimensions.width30,
                      //   //                 right: Dimensions.width30,
                      //   //                 top: Dimensions.height20,
                      //   //               ),
                      //   //
                      //   //               child: Column(
                      //   //                 children: [
                      //   //                   Container(
                      //   //                     width: 120,
                      //   //                     height: 160,
                      //   //                     decoration: BoxDecoration(
                      //   //                         color: Colors.white,
                      //   //                         borderRadius: BorderRadius.circular(
                      //   //                             Dimensions.radius15),
                      //   //                         image: DecorationImage(
                      //   //                             image: NetworkImage(
                      //   //                                 allProducts.allProductList[i].images.toString()
                      //   //                             )
                      //   //                         ),
                      //   //                         boxShadow: [
                      //   //                           BoxShadow(
                      //   //                             blurRadius: 3,
                      //   //                             offset: Offset(5, 5),
                      //   //                             color: AppColors.paraColor
                      //   //                                 .withOpacity(0.1),
                      //   //                           ),
                      //   //                           BoxShadow(
                      //   //                             blurRadius: 3,
                      //   //                             offset: Offset(-5, -5),
                      //   //                             color: AppColors.paraColor
                      //   //                                 .withOpacity(0.1),
                      //   //                           )
                      //   //                         ]),
                      //   //                   ),
                      //   //                   Center(
                      //   //                     child: Align(
                      //   //                         alignment: Alignment.bottomCenter,
                      //   //                         child: Text(
                      //   //                           // info[b]['name']
                      //   //                             "hello"
                      //   //                         )),
                      //   //                   )
                      //   //                 ],
                      //   //               ),
                      //   //             ),
                      //   //             SizedBox(
                      //   //               height: Dimensions.height20,
                      //   //             )
                      //   //           ],
                      //   //         );
                      //   //       });
                      //   // },)
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

}

/*
class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  @override
  Widget build(BuildContext context) {
    // List<Categories>? categories = Get.find<CategoryController>().getCategoryList() as List<Categories>;
    final category = Provider.of<CategoryProvider>(context);
    final allProducts = Provider.of<AllProductsProvider>(context);


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
          backgroundColor: AppColors.mainColor,
        ),
        body: Padding(
      padding: EdgeInsets.all(Dimensions.height10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Hello! Abishan",
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Text(
                            "Let's find the best products for you",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      // Container(
                      //   alignment: Alignment.topRight,
                      //   child: IconButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           Navigator.push(context, '/profile');
                      //         });
                      //       },
                      //       icon: const FaIcon(
                      //         FontAwesomeIcons.solidUser,
                      //         size: 18,
                      //       )),
                      // ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.grey.shade800,
                          backgroundImage: NetworkImage(
                            "https://i.mydramalist.com/vK4lp_5f.jpg",
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.height05),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.search,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search for products',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width45,
                    ),
                    child: SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: Carousel(
                        images: [
                          Image.asset(
                            'assets/image/logo.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/image/logo.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/image/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: Dimensions.font26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                      textAlign: TextAlign.start,
                    ),
                  ),

                 Column(
                   children: [
                     FutureBuilder(
                       future: category.getData(),
                        builder: (context,AsyncSnapshot<List<Categories>> snapshot ){
                         if(snapshot.hasData){
                           return  SizedBox(
                             height: 60,
                             child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: snapshot.data!.length,
                                 itemBuilder: (context, index) {
                                   return Container(
                                     child: Row(
                                       children: [
                                         CircleAvatar(
                                           // child: Container(
                                           //     width: 50,
                                           //     height: 50,
                                           //     decoration: BoxDecoration(
                                           //         borderRadius: BorderRadius.circular(
                                           //             Dimensions.radius20),
                                           //         image: DecorationImage(
                                           //           // image: AssetImage(
                                           //           //     "assets/image/logo.png")
                                           //             image: NetworkImage(
                                           //                 category.categoryList[index].categoryImage.toString(),
                                           //
                                           //              )
                                           //         )
                                           //         )),
                                           radius: 18,
                                           backgroundImage: NetworkImage(
                                             snapshot.data![index]
                                                 .categoryImage
                                                 .toString(),
                                           ),
                                         ),
                                         SizedBox(
                                           width: Dimensions.width10,
                                         ),
                                         Text(
                                           // info[index]['name'],
                                           // categories![index].name.toString(),
                                           snapshot.data![index].name.toString(),
                                           style: TextStyle(
                                               fontSize: Dimensions.font20,
                                               fontWeight: FontWeight.bold),
                                         ),
                                         SizedBox(
                                           width: Dimensions.width10,
                                         )
                                       ],
                                     ),
                                   );
                                 }),
                           );
                         }
                         else{
                           return CircularProgressIndicator(
                             color: AppColors.blueColor,
                           );

                          }
                        }
                     )
                   ],
                 ),


          SizedBox(
                    height: Dimensions.height10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Just For You ",
                      style: TextStyle(
                          fontSize: Dimensions.font26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  //###########
                  Column(
                    children: [
                      FutureBuilder(
                          future:allProducts.getData(),
                          builder: (context,AsyncSnapshot<List<ProductDetail>> snapshot){
                            if(snapshot.hasData){
                              return SingleChildScrollView(
                                child: SizedBox(
                                  height: 150,
                                  child: ListView.builder(
                                    // itemCount: (info.length.toDouble() / 2).toInt(),
                                      itemCount: snapshot.data!.length,


                                      //   itemCount: (snapshot.data!.length.toDouble() / 2).toInt(),
                                      itemBuilder: (context, i) {
                                      //   int a = 2 * i;
                                      //   int b = 2 * i + 1;
                                        // return Row(
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   children: [
                                        //     Padding(
                                        //       padding: EdgeInsets.only(
                                        //           left: Dimensions.width10,
                                        //           right: Dimensions.width10,
                                        //           top: Dimensions.height20,
                                        //           bottom: Dimensions.height20),
                                        //       // padding: EdgeInsets.all(Dimensions.height20),
                                        //
                                        //       child: Column(
                                        //         children: [
                                        //           Material(
                                        //             child: InkWell(
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 120,
                                        //                 decoration: BoxDecoration(
                                        //                     color: Colors.white,
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(
                                        //                             Dimensions.radius15),
                                        //                     image: DecorationImage(
                                        //                         image: NetworkImage(
                                        //                             allProductList[i]
                                        //                                 .images
                                        //                                 .toString())),
                                        //                     boxShadow: [
                                        //                       BoxShadow(
                                        //                         blurRadius: 3,
                                        //                         offset: Offset(5, 5),
                                        //                         color: AppColors.paraColor
                                        //                             .withOpacity(0.1),
                                        //                       ),
                                        //                       BoxShadow(
                                        //                         blurRadius: 3,
                                        //                         offset: Offset(-5, -5),
                                        //                         color: AppColors.paraColor
                                        //                             .withOpacity(0.1),
                                        //                       )
                                        //                     ]),
                                        //               ),
                                        //               // onTap: () => Navigator.push(
                                        //               //     context,
                                        //               //     MaterialPageRoute(
                                        //               //         builder: (context) =>
                                        //               //             SingleProduct(
                                        //               //                 item: items[i]))),
                                        //             ),
                                        //           ),
                                        //           Center(
                                        //             child: Align(
                                        //                 alignment: Alignment.bottomCenter,
                                        //                 child: Text(
                                        //                   // info[i]['name']
                                        //                   allProductList[a]
                                        //                       .name
                                        //                       .toString(),
                                        //                   style: TextStyle(
                                        //                       fontSize:
                                        //                           Dimensions.font16),
                                        //                 )),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     Padding(
                                        //       // padding: EdgeInsets.all(Dimensions.height20),
                                        //       padding: EdgeInsets.only(
                                        //         left: Dimensions.width10,
                                        //         right: Dimensions.width10,
                                        //         top: Dimensions.height20,
                                        //       ),
                                        //
                                        //       child: Column(
                                        //         children: [
                                        //           Container(
                                        //             width: 100,
                                        //             height: 120,
                                        //             decoration: BoxDecoration(
                                        //                 color: Colors.white,
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                         Dimensions.radius15),
                                        //                 image: DecorationImage(
                                        //                     image: NetworkImage(
                                        //                         allProductList[b]
                                        //                             .images
                                        //                             .toString())),
                                        //                 boxShadow: [
                                        //                   BoxShadow(
                                        //                     blurRadius: 3,
                                        //                     offset: Offset(5, 5),
                                        //                     color: AppColors.paraColor
                                        //                         .withOpacity(0.1),
                                        //                   ),
                                        //                   BoxShadow(
                                        //                     blurRadius: 3,
                                        //                     offset: Offset(-5, -5),
                                        //                     color: AppColors.paraColor
                                        //                         .withOpacity(0.1),
                                        //                   )
                                        //                 ]),
                                        //           ),
                                        //           Center(
                                        //             child: Align(
                                        //                 alignment: Alignment.bottomCenter,
                                        //                 child: Text(
                                        //                   // info[b]['name']
                                        //                   allProductList[b]
                                        //                       .name
                                        //                       .toString(),
                                        //                   style: TextStyle(
                                        //                       fontSize:
                                        //                           Dimensions.font16),
                                        //                 )),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     SizedBox(
                                        //       height: Dimensions.height20,
                                        //     )
                                        //   ],
                                        // );

                                        return Padding(
                                          // padding: EdgeInsets.all(Dimensions.height20),
                                          padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10,),

                                          child: InkWell(
                                            onTap: (){
                                              print(snapshot.data![i]);
                                              ProductDetail item = snapshot.data![i];
                                              print(item.name);
                                              bool isWishedItem = Provider.of<SingleProductProvider>(context,listen: false).isWishedItem;

                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleProduct(item:item,isWisheditem: isWishedItem)));
                                              Provider.of<SingleProductProvider>(context,listen: false).restartItemCount();


                                            },
                                            child: Container(
                                              height: 120,
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
                                                        height: 80,
                                                        width: 60,
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
                                                        Flexible(
                                                          child: Text(
                                                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                                                            // info[0][i]['name'],
                                                            snapshot.data![i].name.toString(),
                                                            style: TextStyle(
                                                                fontSize: Dimensions.font16,
                                                                fontWeight: FontWeight.bold,
                                                                overflow: TextOverflow.visible),
                                                          ),
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

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
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
                  )






                  //###############
                  //   // child: GetBuilder<AllProductController>(builder: (allProducts){
                  //   //
                  //   //   return ListView.builder(
                  //   //     // itemCount: (info.length.toDouble() / 2).toInt(),
                  //   //       itemCount: allProducts.allProductList.length,
                  //   //       itemBuilder: (context, i) {
                  //   //         int a = 2 * i;
                  //   //         int b = 2 * i + 1;
                  //   //         return Row(
                  //   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   //           children: [
                  //   //             Padding(
                  //   //               padding: EdgeInsets.only(
                  //   //                   left: Dimensions.width20,
                  //   //                   right: Dimensions.width20,
                  //   //                   top: Dimensions.height20,
                  //   //                   bottom: Dimensions.height20),
                  //   //               // padding: EdgeInsets.all(Dimensions.height20),
                  //   //
                  //   //               child: Column(
                  //   //                 children: [
                  //   //                   Material(
                  //   //                     child: InkWell(
                  //   //                       child: Container(
                  //   //                         width: 120,
                  //   //                         height: 160,
                  //   //                         decoration: BoxDecoration(
                  //   //                             color: Colors.white,
                  //   //                             borderRadius:
                  //   //                             BorderRadius.circular(
                  //   //                                 Dimensions.radius15),
                  //   //                             image: DecorationImage(
                  //   //                                 image: AssetImage(
                  //   //                                     'assets/image/logo.png')),
                  //   //                             boxShadow: [
                  //   //                               BoxShadow(
                  //   //                                 blurRadius: 3,
                  //   //                                 offset: Offset(5, 5),
                  //   //                                 color: AppColors.paraColor
                  //   //                                     .withOpacity(0.1),
                  //   //                               ),
                  //   //                               BoxShadow(
                  //   //                                 blurRadius: 3,
                  //   //                                 offset: Offset(-5, -5),
                  //   //                                 color: AppColors.paraColor
                  //   //                                     .withOpacity(0.1),
                  //   //                               )
                  //   //                             ]),
                  //   //                       ),
                  //   //                       onTap: () => Navigator.push(
                  //   //                           context,
                  //   //                           MaterialPageRoute(
                  //   //                               builder: (context) =>
                  //   //                                   SingleProduct(
                  //   //                                       item: items[i]))),
                  //   //                     ),
                  //   //                   ),
                  //   //                   Center(
                  //   //                     child: Align(
                  //   //                         alignment: Alignment.bottomCenter,
                  //   //                         child: Text(
                  //   //                           // info[a]['name']
                  //   //                             allProducts.allProductList[i].name.toString()
                  //   //                         )),
                  //   //                   )
                  //   //                 ],
                  //   //               ),
                  //   //             ),
                  //   //             Padding(
                  //   //               // padding: EdgeInsets.all(Dimensions.height20),
                  //   //               padding: EdgeInsets.only(
                  //   //                 left: Dimensions.width30,
                  //   //                 right: Dimensions.width30,
                  //   //                 top: Dimensions.height20,
                  //   //               ),
                  //   //
                  //   //               child: Column(
                  //   //                 children: [
                  //   //                   Container(
                  //   //                     width: 120,
                  //   //                     height: 160,
                  //   //                     decoration: BoxDecoration(
                  //   //                         color: Colors.white,
                  //   //                         borderRadius: BorderRadius.circular(
                  //   //                             Dimensions.radius15),
                  //   //                         image: DecorationImage(
                  //   //                             image: NetworkImage(
                  //   //                                 allProducts.allProductList[i].images.toString()
                  //   //                             )
                  //   //                         ),
                  //   //                         boxShadow: [
                  //   //                           BoxShadow(
                  //   //                             blurRadius: 3,
                  //   //                             offset: Offset(5, 5),
                  //   //                             color: AppColors.paraColor
                  //   //                                 .withOpacity(0.1),
                  //   //                           ),
                  //   //                           BoxShadow(
                  //   //                             blurRadius: 3,
                  //   //                             offset: Offset(-5, -5),
                  //   //                             color: AppColors.paraColor
                  //   //                                 .withOpacity(0.1),
                  //   //                           )
                  //   //                         ]),
                  //   //                   ),
                  //   //                   Center(
                  //   //                     child: Align(
                  //   //                         alignment: Alignment.bottomCenter,
                  //   //                         child: Text(
                  //   //                           // info[b]['name']
                  //   //                             "hello"
                  //   //                         )),
                  //   //                   )
                  //   //                 ],
                  //   //               ),
                  //   //             ),
                  //   //             SizedBox(
                  //   //               height: Dimensions.height20,
                  //   //             )
                  //   //           ],
                  //   //         );
                  //   //       });
                  //   // },)
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
*/