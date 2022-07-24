import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSuccessful extends StatefulWidget {
  const OrderSuccessful({Key? key}) : super(key: key);

  @override
  _OrderSuccessfulState createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Order Successful",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,

            ),),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body:Column(
        children: [
          Padding(
            padding:EdgeInsets.all(Dimensions.height45),
            child: Container(
              height: 300,
              // child: Image.network(info[i]['category_image']),
              child: Image.asset('assets/image/logo.png'),
            ),
          ),
          Text("Order Confirmed",
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text("Sit back and relax your order will be on",
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.font16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text("your door step after 2-3 working hours!",
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.font16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/home');
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
                        'Shop More',
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

      )
    );
  }
}
