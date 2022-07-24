import 'package:ecom/models/address.dart';
import 'package:ecom/screens/address/add_address.dart';
import 'package:ecom/screens/orders/order_process.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/address_provider.dart';

class AddressList extends StatelessWidget {

  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddressProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Select Address",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,

            ),),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewAddress()));
              },

              child: Padding(
                padding: EdgeInsets.all(Dimensions.height05),
                child: Container(
                  height: Dimensions.height60,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add New Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          FutureBuilder(
              future:address.getData(),
              builder: (context,AsyncSnapshot<List<Adresses>?> snapshot ){
                if(snapshot.hasData){
                  return Expanded(
                    child: ListView.separated(

                      // itemCount: productsList == null? 0:productsList!.length,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, _) => SizedBox(
                          height: Dimensions.height20,
                        ),
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: (){
                              Adresses adress = snapshot.data![i];
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderProcess(adresses: adress,)));

                            },
                            child: Padding(
                              // padding: EdgeInsets.all(Dimensions.height20),
                              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width45,top: Dimensions.height20,),
                              child: Container(
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
                                            snapshot.data![i].province!,
                                            style: TextStyle(
                                                fontSize: Dimensions.font20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                                            snapshot.data![i].city!,
                                            style: TextStyle(
                                                fontSize: Dimensions.font20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            // productsList![i].name! == null?"No vlue":productsList![i].name!,
                                            snapshot.data![i].street!,
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

