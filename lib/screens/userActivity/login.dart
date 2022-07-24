import 'dart:convert';

import 'package:ecom/models/login_response.dart';
import 'package:ecom/models/users.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/utils/shared_prefs.dart';
import 'package:ecom/widgets/click_button.dart';
import 'package:ecom/widgets/snackbar.dart';
import 'package:ecom/widgets/user_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  bool valuesecond = false;



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

              Text("Log In",
                style: TextStyle(
                  fontSize: Dimensions.font26,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign:TextAlign.start,),
              SizedBox(height: Dimensions.height45,),
              UserCred(
                hint: '📧 Email',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,

              ),
              SizedBox(height: Dimensions.height20,),
              UserCred(
                hint: '🔑 Password',
                label: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: Dimensions.height20,),
              Row(
                children: [
                  Checkbox(
                    value: this.valuesecond,
                    onChanged: (bool? value) {
                      setState(() {
                        this.valuesecond = value!;
                      });
                    },
                  ),
                  SizedBox(width: Dimensions.width10,),
                  Text("Remember me",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    color: AppColors.blueColor,
                    // fontWeight: FontWeight.w700,
                  ),)

                ],
              ),
              SizedBox(height: Dimensions.height20,),
              ClickButton(
                onPressed: (){
                  login();
                },
                text: 'Log In',),
              SizedBox(height: Dimensions.height20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.normal
                    ),
                    ),
                    SizedBox(width: Dimensions.width10,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,"/register");
                      },
                      child: Text("Register",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: AppColors.blueColor,
                      ),),
                    )
                  ],
                ),
              )



            ],
          ),
        ),
      ),

    );
  }

  login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackbar.showSnackbar(
          context, 'All fields required!', Colors.red, Colors.white);
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      CustomSnackbar.showSnackbar(
          context, 'Please enter valid email 😔 !', Colors.red, Colors.white);
    }
    setState(() {
      isLoading = true;
    });

    // var response =  await http.get(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/wishlist"));

    var response = await http.post(Uri.parse("https://abishanchemjong.com.np/ecommerce/api/v1/login"), body: {
      'email': emailController.text,
      'password': passwordController.text
    });
    print(response);
    if(response.statusCode == 200){
      print("Success");
    }

    var res = await json.decode(response.body.substring(3,response.body.length));
    print(res);
    LogInResponse user = LogInResponse.fromJson(res);


    if (user.error == false) {
      // User user = User.fromJson(res['data']);
      LogInResponse loggedUser = LogInResponse.fromJson(res);
      print(loggedUser);
      print(loggedUser.name);
      // SharedPrefs().storeString('user', loggedUser!.name!);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uName', loggedUser.name!);
      prefs.setString('apiKey',loggedUser.apiKey!);
      prefs.setString('uPhone', loggedUser.phoneNo!);
      prefs.setString('uEmail', loggedUser.email!);

      await SharedPrefs().storeUser(json.encode(loggedUser));
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      CustomSnackbar.showSnackbar(context, 'Login Success  🤩 ',
          const Color.fromARGB(255, 3, 236, 127), Colors.white);
    } else {
      CustomSnackbar.showSnackbar(
          context, 'Login Failed 😔', Colors.red, Colors.white);
    }
    setState(() {
      isLoading = false;
    });
  }
}
