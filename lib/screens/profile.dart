// import 'dart:html';

import 'dart:convert';
import 'dart:developer';

import 'package:ecom/models/login_response.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/utils/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name = '';
  String phone = '';

  LogInResponse logInResponse = LogInResponse.fromJson({
  'error' : true,
  'name' : '',
  'email' : '',
  'apiKey' : '',
  'createdAt' : '',
  'phoneNo' : '',
  'isStaff' : true

  });

  getUserData() async{
    var userData = await SharedPrefs().getUser();
setState(() {
  logInResponse = LogInResponse.fromJson(json.decode(userData));
  print("Name : ${logInResponse.name} , ${logInResponse.phoneNo}");
});


  }

  // getUser() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('uName'));
  //   name = prefs.getString('uName')!;
  //   phone = prefs.getString('uPhone')!;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
    getUserData();


  }

  @override
  Widget build(BuildContext context) {
    // print(SharedPrefs().getUser());
    // LogInResponse logInResponse = SharedPrefs().getUser();
    // print("Name : ${logInResponse.name}");
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("User Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,

            ),),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:Dimensions.height30),
            child: InkWell(
              onTap: (){
                SharedPrefs().clearUp();
                Navigator.pushNamed(context, '/login');
              },
              child: Center(
                    child: Icon(Icons.logout,
                    color: Colors.white,),

              ),
            ),
          ),
        ],
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding:EdgeInsets.only(left:Dimensions.height45,right: Dimensions.height45,top: Dimensions.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children:[
                  Container(
                  child: Padding(
                    padding:EdgeInsets.all(Dimensions.height45),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      // child: Image.network(info[i]['category_image']),
                      // child: Image.asset('assets/image/logo.png'),
                      child: Image.network(
                        "https://i.mydramalist.com/vK4lp_5f.jpg",


                      ),
                    ),
                  ),

                ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.height45),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(logInResponse.name!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font26,
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.solidEdit,
                          size: 20,
                          color:Colors.white
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
            Text("Mobile",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            Text(logInResponse.phoneNo??"9817100019",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            Text("Total Orders",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            Text("05 orders",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            Text("Address",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            Text("Gandaki,Pokhara,Ranipauwa",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.font16,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],

        ),
      ),

    );
  }
}
