import 'dart:convert';

import 'package:ecom/models/all_products.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


import '../providers/single_product_provider.dart';

class SingleProduct extends StatelessWidget {
  ProductDetail item;
  Future<bool> isWisheditem;
  SingleProduct({
    required this.item,
    required this.isWisheditem,
    Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final product = Provider.of<SingleProductProvider>(context);
    print(isWisheditem);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          // icon: Icon(Icons.arrow_back_ios),
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title:Center(
          child: Text("Product Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,

            ),),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimensions.height05),
        child: Container(
          height: Dimensions.height60,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){

                product.addToCart(item.id!, product.itemCount);

                if(true){
                  CustomSnackbar.showSnackbar(context, 'Added to cart.',
                      const Color.fromARGB(255, 3, 236, 127), Colors.white);

                }
                CustomSnackbar.showSnackbar(context, 'Already on cart.',
                    const Color.fromARGB(143,255,0,0), Colors.white);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height45),
          // padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width45,top: Dimensions.height20,),

          child: Column(
            children: [
              Container(
                height:250,
                // child: Image.network(info[i]['category_image']),
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            image: DecorationImage(

                image: NetworkImage(
                  item.images.toString().substring(1,item.images.toString().length-1)
                ),
            )
        )

              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name??"Name",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold),
                  ),
          FutureBuilder(
              future: product.isWishedListItem(item.id!),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return  InkWell(
                    onTap: (){
                      int id = item.id??42;

                      product.addToWishList(id);
                      if(snapshot.data == false){
                        CustomSnackbar.showSnackbar(context, 'Added to wishlist.',
                            const Color.fromARGB(255, 3, 236, 127), Colors.white);

                      }
                      else if(snapshot.data == true){
                        CustomSnackbar.showSnackbar(context, 'Removed from wishlist.',
                            const Color.fromARGB(143,255,0,0), Colors.white);
                      }



                      // product.isWishedItem = !product.isWishedItem;
                      //   setState(() {
                      //     if(isWishedItem){
                      //       isWishedItem = false;
                      //     }
                      //     else{
                      //       isWishedItem = true;
                      //     }
                      //     isWishedItem = !isWishedItem;
                      //   });
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidHeart,
                      size: 20,
                      // color:Colors.red
                      color: snapshot.data == true?Colors.red:Colors.black,
                    ),
                  );
                }
                else{
                  return CircularProgressIndicator(
                    color: AppColors.blueColor,
                  );
                }
              }),




                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.discountPrice.toString(),
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                        decoration: TextDecoration.lineThrough

                    ),

                  ),
                  SizedBox(width: Dimensions.width10,),
                  Text(item.price.toString(),
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor
                    ),)
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(!product.minusItem()){
                        CustomSnackbar.showSnackbar(context, 'Product count cannot be less than 1.',
                            const Color.fromARGB(143,255,0,0), Colors.white);
                      }


                    },
                    child: FaIcon(
                      FontAwesomeIcons.minus,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10,),
                  Text(
                    product.itemCount.toString(),
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor
                    ),),
                  SizedBox(width: Dimensions.width10,),
                  GestureDetector(
                    onTap: (){

                      if(!product.plusItem()){
                        CustomSnackbar.showSnackbar(context, 'You have reached the maximum unit for this product.',
                            const Color.fromARGB(143,255,0,0), Colors.white);
                      }

                    },
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Column(
                children: [
                  Text("Description",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color:Colors.black

                    ),),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Text(item.description.toString(),
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        // fontWeight: FontWeight.bold,
                        color:Colors.black

                    ),),
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}


// class SingleProduct extends StatefulWidget {
//   ProductDetail item;
//
//   SingleProduct({
//     required this.item,
//     Key? key}) : super(key: key);
//
//   @override
//   _SingleProductState createState() => _SingleProductState();
// }
//
// class _SingleProductState extends State<SingleProduct> {
//
//   // List info = [];
//   int productCount =1;
//   bool isWishedItem = false;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     // print(item.name);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           color: Colors.white,
//           // icon: Icon(Icons.arrow_back_ios),
//           icon: Icon(Icons.arrow_back),
//           iconSize: 30.0,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         automaticallyImplyLeading: true,
//         elevation: 0.0,
//         title:Center(
//           child: Text("Product Details",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: Dimensions.font26,
//               fontWeight: FontWeight.bold,
//
//             ),),
//         ),
//         backgroundColor: AppColors.mainColor,
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(Dimensions.height05),
//         child: Container(
//           height: Dimensions.height60,
//           decoration: BoxDecoration(
//               color: AppColors.mainColor,
//               borderRadius: BorderRadius.circular(Dimensions.radius20),
//               border: Border.all(color: Colors.black)),
//           child: Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: const [
//                 FaIcon(
//                   FontAwesomeIcons.shoppingCart,
//                   size: 20,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'Add to Cart',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.height45),
//           // padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width45,top: Dimensions.height20,),
//
//           child: Column(
//             children: [
//               Container(
//                 height:250,
//                 // child: Image.network(info[i]['category_image']),
//                 child: Image.asset('assets/image/logo.png'),
//               ),
//               SizedBox(
//                 height: Dimensions.height20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     item.name,
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   InkWell(
//                     onTap: (){
//                       setState(() {
//                         // if(isWishedItem){
//                         //   isWishedItem = false;
//                         // }
//                         // else{
//                         //   isWishedItem = true;
//                         // }
//                           isWishedItem = !isWishedItem;
//                       });
//                     },
//                     child: FaIcon(
//                       FontAwesomeIcons.solidHeart,
//                       size: 20,
//                       // color:Colors.red
//                       color: isWishedItem?Colors.red:Colors.black,
//                     ),
//                   ),
//              ],
//               ),
//               SizedBox(
//                 height: Dimensions.height20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Rs 2000",
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.bold,
//                         color:Colors.black,
//                         decoration: TextDecoration.lineThrough
//
//                     ),
//
//                   ),
//                   SizedBox(width: Dimensions.width10,),
//                   Text("Rs 1800",
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.mainColor
//                     ),)
//                 ],
//               ),
//               SizedBox(
//                 height: Dimensions.height20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         if(productCount!=1){
//                           productCount--;
//                         }
//                         else{
//                           CustomSnackbar.showSnackbar(context, 'Product count cannot be less than 1.',
//                               const Color.fromARGB(255, 3, 236, 127), Colors.white);
//                         }
//
//                       });
//
//                     },
//                     child: FaIcon(
//                       FontAwesomeIcons.minus,
//                       size: 20,
//                     ),
//                   ),
//                   SizedBox(width: Dimensions.width10,),
//                   Text(
//                     productCount.toString(),
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.mainColor
//                     ),),
//                   SizedBox(width: Dimensions.width10,),
//                   GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         if(productCount<10){
//                           productCount++;
//                         }
//                         else{
//                           CustomSnackbar.showSnackbar(context, 'You have reached the maximum unit for this product.',
//                               const Color.fromARGB(255, 3, 236, 127), Colors.white);
//                         }
//                       });
//
//                     },
//                     child: FaIcon(
//                       FontAwesomeIcons.plus,
//                       size: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: Dimensions.height20,
//               ),
//               Column(
//                 children: [
//                   Text("Description",
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         fontWeight: FontWeight.bold,
//                         color:Colors.black
//
//                     ),),
//                   SizedBox(
//                     height: Dimensions.height20,
//                   ),
//                   Text("The primary color of the button when the button is in the down (pressed) state. The splash is "
//                       "represented as a circular overlay that appears above the highlightColor overlay. The splash overlay has"
//                       " a center point that matches the hit point of the user touch event. The splash overlay will expand to fill "
//                       "the button area if the touch is held for long enough time. If the splash color has transparency then the "
//                       "highlight and button color will show through.",
//                     style: TextStyle(
//                         fontSize: Dimensions.font20,
//                         // fontWeight: FontWeight.bold,
//                         color:Colors.black
//
//                     ),),
//                 ],
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // bool productCountCheck(){
//   //   if(productCount >= 10){
//   //     CustomSnackbar.showSnackbar(context, 'You have reached the maximum unit for this product.',
//   //         const Color.fromARGB(255, 3, 236, 127), Colors.white);
//   //     return false;
//   //   }
//   //   else if(productCount <=1){
//   //     CustomSnackbar.showSnackbar(context, 'Product count cannot be less than 1.',
//   //         const Color.fromARGB(255, 3, 236, 127), Colors.white);
//   //     return false;
//   //   }
//   //   else{
//   //     return true;
//   //   }
//   //
//   //
//   // }
//
// }
