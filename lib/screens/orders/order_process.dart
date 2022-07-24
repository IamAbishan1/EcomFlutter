import 'package:ecom/models/address.dart';
import 'package:ecom/screens/orders/khalti.dart';
import 'package:ecom/screens/orders/order_successful.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khalti/khalti.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../providers/cartlist_provider.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/snackbar.dart';
import '../address/addresslist.dart';

class OrderProcess extends StatelessWidget {
  Adresses? adresses;
  OrderProcess({
    this.adresses,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartListProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title:Center(
            child: Text("Order Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,

              ),),
          ),
          backgroundColor: AppColors.mainColor,
        ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,

                ),),
              SizedBox(
                height: 130,
                child: FutureBuilder(
                    future: cart.getData(),
                    builder: (context,AsyncSnapshot<List<CartProducts>?> snapshot){
                      if(snapshot.hasData){
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            separatorBuilder: (context, _) => SizedBox(
                              height: Dimensions.height20,
                            ),
                            itemBuilder: (_, i) {
                              return Padding(
                                // padding: EdgeInsets.all(Dimensions.height20),
                                padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width45,top: Dimensions.height20,),

                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    // color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left:Dimensions.height10),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 60,
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
                                              Text(
                                                snapshot.data![i].name.toString(),
                                                style: TextStyle(
                                                    fontSize: Dimensions.font16,
                                                    fontWeight: FontWeight.bold),
                                              ),
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
                                                  SizedBox(width: Dimensions.height10,),
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
                                                  // FaIcon(
                                                  //   FontAwesomeIcons.minus,
                                                  //   size: 20,
                                                  // ),
                                                  Text("Number of Items : ",
                                                    style: TextStyle(
                                                        fontSize: Dimensions.font20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black
                                                    ),),

                                                  SizedBox(width: Dimensions.width10,),
                                                  Text(snapshot.data![i].quantity.toString(),
                                                    style: TextStyle(
                                                        fontSize: Dimensions.font20,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColors.mainColor
                                                    ),),
                                                  SizedBox(width: Dimensions.width10,),
                                                  // FaIcon(
                                                  //   FontAwesomeIcons.plus,
                                                  //   size: 15,
                                                  // ),
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

                            });
                      }
                      else{
                        return Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: AppColors.blueColor,
                          ),
                        );
                      }
                    }),
              ),
              SizedBox(height: Dimensions.height20,),
              adresses == null?Text("Delivery Location",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,

                ),):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.bold,

                        ),),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.height20),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressList()));

                          },
                          child: Text("Change Location",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold,

                            ),),
                        ),
                      ),

                    ],
                  ),

              SizedBox(height: Dimensions.height10,),
              adresses==null? Row(
                children: [
                  Container(
                    height: 60,
                    child: Icon(Icons.location_on,color: Colors.black,),
                  ),
                  Text("Select Delivery Location",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(width: Dimensions.height45,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressList()));
                    },

                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 50,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                      ),
                    ),
                  ),

                ],

              ):Container(
                height: 115,
                decoration: BoxDecoration(
                  // color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding:EdgeInsets.all(Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimensions.height80,
                        // child: Image.network(info[i]['category_image']),
                        child: Image.asset('assets/image/location1.png'),
                      ),
                      SizedBox(
                        width: Dimensions.width45,
                      ),
                      Column(
                        children: [
                          Text(
                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                            adresses!.province!,
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                            adresses!.city!,
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                            adresses!.street!,
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.bold),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20,),

              Text("Payment Method",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,

                ),),
              SizedBox(height: Dimensions.height20,),

              Row(
                children: [
                  InkWell(
                    onTap: (){
                      if(adresses == null){
                        CustomSnackbar.showSnackbar(context, 'Address must be given before making order.',
                            const Color.fromARGB(143,255,0,0), Colors.white);

                      }
                      else if( adresses != null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSuccessful()));

                      }
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Image.asset('assets/image/cod.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width20,),
                  InkWell(
                    onTap: (){
                      if(adresses == null){
                        CustomSnackbar.showSnackbar(context, 'Address must be given before making order.',
                            const Color.fromARGB(143,255,0,0), Colors.white);

                      }else if(adresses != null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const KhaltiPayment()));
                        // final config = PaymentConfig(
                        //   amount: 10000, // Amount should be in paisa
                        //   productIdentity: 'dell-g5-g5510-2021',
                        //   productName: 'Dell G5 G5510 2021',
                        //   productUrl: 'https://www.khalti.com/#/bazaar',
                        //   additionalData: { // Not mandatory; can be used for reporting purpose
                        //     'vendor': 'Khalti Bazaar',
                        //   },
                        // );
                        // KhaltiButton(
                        //   config: config,
                        //   preferences: [ // Not providing this will enable all the payment methods.
                        //     PaymentPreference.khalti,
                        //     PaymentPreference.eBanking,
                        //   ],
                        //   onSuccess: (successModel) {
                        //     // Perform Server Verification
                        //   },
                        //   onFailure: (failureModel) {
                        //     // What to do on failure?
                        //   },
                        //   onCancel: () {
                        //     // User manually cancelled the transaction
                        //   },
                        // );


                      }
                    },

                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Image.asset('assets/image/khalti.png'),
                      ),
                    ),
                  )

                ],
              ),
              SizedBox(height: Dimensions.height20,),

              Text("Order Info",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,

                ),),
              SizedBox(height: Dimensions.height20,),

              Container(
                decoration: BoxDecoration(
                  // color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    border: Border.all(color: Colors.black)),

                child: Padding(
                  padding:EdgeInsets.only(left:Dimensions.height20,right: Dimensions.height60,top: Dimensions.height20,bottom: Dimensions.height20),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SubTotal",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),
                          Text("2500",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),


                        ],
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Charge",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),
                          Text("250",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),


                        ],
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),
                          Text("2700",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,

                            ),),


                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSuccessful()));

                      },
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(fontSize: 16,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),
        )
      )
    );
  }
}
