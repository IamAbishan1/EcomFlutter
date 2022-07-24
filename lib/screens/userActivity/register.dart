import 'dart:convert';
import 'dart:io';

import 'package:ecom/models/register_response.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/click_button.dart';
import 'package:ecom/widgets/snackbar.dart';
import 'package:ecom/widgets/user_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 TextEditingController userNameController= TextEditingController();
 TextEditingController userRegisterEmailController= TextEditingController();
 TextEditingController userPasswordController= TextEditingController();
 TextEditingController userPasswordConfirmController= TextEditingController();
 TextEditingController userPhoneController= TextEditingController();

 bool valuefirst = false;
 bool isLoading = false;


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("eCom"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height45,),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/image/logo.png'),
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: Dimensions.height20,),

              Text("Register",
                style: TextStyle(
                  fontSize: Dimensions.font26,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign:TextAlign.start,),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: '📧 UserName',
                label: 'User',
                keyboardType: TextInputType.text,
                controller: userNameController,

              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: '📧 Email',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: userRegisterEmailController,

              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: '🔑 Password',
                label: 'Password',
                controller: userPasswordController,
                obscureText: true,
              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: '🔑 Confirm Password',
                label: 'Confirm Password',
                controller: userPasswordConfirmController,
                obscureText: true,
              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: 'Phone No',
                label: 'Phone No',
                controller: userPhoneController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: Dimensions.height20,),

              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: this.valuefirst,
                        onChanged: (bool? value) {
                          setState(() {
                            this.valuefirst = value!;
                          });
                        },
                      ),
                      SizedBox(width: Dimensions.width30,),
                      Text("By signing up you accept the",
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          // color: AppColors.blueColor,
                          // fontWeight: FontWeight.w700,
                        ),),
                      SizedBox(width: 5,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Terms of Service",
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: AppColors.blueColor,
                        ),),

                      SizedBox(width: 5,),
                      Text(" and ",
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          // color: AppColors.blueColor,
                          // fontWeight: FontWeight.w700,
                        ),),

                      Text(" Privacy Policy",
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: AppColors.blueColor,
                        ),)
                    ],
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
              ClickButton(
                onPressed:(){
                  signup();

                },
                text: 'Register',),
              SizedBox(height: Dimensions.height20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(width: Dimensions.width10,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,"/login");
                      },
                      child: Text("Log In",
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          color: AppColors.blueColor,
                        ),),
                    ),
                    SizedBox(height: Dimensions.height45,)
                  ],
                ),
              )



            ],
          ),
        ),
      ),

    );
  }

 signup() async {
   if (userNameController.text.isEmpty ||
       userRegisterEmailController.text.isEmpty ||
       userPasswordController.text.isEmpty ||
       userPasswordConfirmController.text.isEmpty ||
       userPhoneController.text.isEmpty
       ) {
     CustomSnackbar.showSnackbar(
         context, 'All fields required!', Colors.red, Colors.white);
   } else if (!RegExp(
       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
       .hasMatch(userRegisterEmailController.text)) {
     CustomSnackbar.showSnackbar(
         context, 'Please enter valid email!', Colors.red, Colors.white);
   } else if (userPasswordController.text != userPasswordConfirmController.text) {
     CustomSnackbar.showSnackbar(
         context,
         'Password and Confirm password does not match!',
         Colors.red,
         Colors.white);
   } else {
     setState(() {
       isLoading = true;
     });

     var response = await http.post(Uri.parse('https://abishanchemjong.com.np/ecommerce/api/v1/register'),
         body: {
       'name': userNameController.text.toString(),
       'email': userRegisterEmailController.text.toString(),
       'phone_no': userPhoneController.text.toString(),
       'password': userPasswordController.text.toString(),
     });


     var res = await json.decode(response.body.substring(3,response.body.length));
      print(res);
     // RegisterResponse registerResponse = RegisterResponse.fromJson(res);

       if (response.statusCode == 200) {
         Navigator.of(context)
             .pushNamedAndRemoveUntil('/login', (route) => false);
         CustomSnackbar.showSnackbar(
             context, 'Sign up Success', Colors.green, Colors.white);
       }
       else if(response.statusCode == 201){
         CustomSnackbar.showSnackbar(
             context, 'This email already exists!!', Colors.red, Colors.white);
       }
       else {
         CustomSnackbar.showSnackbar(
             context, 'Sign Up Failed', Colors.red, Colors.white);
       }
     setState(() {
       isLoading = false;
     });
   }
 }
}
