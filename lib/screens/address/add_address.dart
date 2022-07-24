import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/user_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  TextEditingController addressProvinceController= TextEditingController();
  TextEditingController addressCityController= TextEditingController();
  TextEditingController addressStreetController= TextEditingController();
  TextEditingController addressDescriptionController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Add New Address",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,

            ),),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding:EdgeInsets.all(Dimensions.height45),
        child: Container(
          child: Column(
            children: [
              UserCred(
                hint: 'Province',
                label: 'Province',
                keyboardType: TextInputType.text,
                controller: addressProvinceController,

              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: 'City',
                label: 'City',
                keyboardType: TextInputType.text,
                controller: addressCityController,

              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: 'Street',
                label: 'Street',
                keyboardType: TextInputType.text,
                controller: addressStreetController,

              ),
              SizedBox(height: Dimensions.height20,),UserCred(
                hint: 'Description',
                label: 'Description',
                keyboardType: TextInputType.text,
                controller: addressDescriptionController,

              ),
              SizedBox(height: Dimensions.height20,),
              GestureDetector(
                onTap: (){
                  //Save address

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
                            'Add Address',
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
              GestureDetector(
                onTap: (){
                  // Back

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
                            'Cancel',
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

            ],

          ),
        ),
      ),

    );
  }
}
