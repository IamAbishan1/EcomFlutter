import 'package:badges/badges.dart';
import 'package:ecom/providers/wishlist_provider.dart';
import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/utils/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'models/product.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  checkUser() async {

    var usr = await SharedPrefs().getUser();
    if (usr == null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
    if(usr != null){
      Navigator.pushReplacementNamed(context, '/home');

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/image/logo.png'),
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

