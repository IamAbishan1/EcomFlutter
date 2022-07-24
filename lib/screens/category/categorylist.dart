import 'dart:convert';
import 'dart:io';

import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/category.dart';
import '../../providers/category_provider.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Shop by Category",
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold,

          ),),
        ),
        backgroundColor: AppColors.mainColor,
      ),


        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: category.getData(),
                builder: (context,AsyncSnapshot<List<Categories>> snapshot ){
                  if(snapshot.hasData){
                    return Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (context, _) => SizedBox(
                            height: Dimensions.height20,
                          ),
                          itemBuilder: (_, i) {
                            return Padding(
                              // padding: EdgeInsets.all(Dimensions.height20),
                              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width45,top: Dimensions.height20,),

                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      // child: Image.network(info[i]['category_image']),
                                      //child: Image.asset('assets/image/logo.png'),
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
                                                      snapshot.data![i].categoryImage.toString()
                                                  )
                                              )
                                          )
                                        // child: Image.asset('assets/image/logo.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width20,
                                    ),
                                    Text(
                                      snapshot.data![i].name.toString(),
                                      style: TextStyle(
                                          fontSize: Dimensions.font20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
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
        )

    );
  }
}


