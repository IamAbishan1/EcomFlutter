import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/product.dart';
import '../screens/single_product.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CategoryItemList extends StatefulWidget {
  const CategoryItemList({Key? key}) : super(key: key);

  @override
  _CategoryItemListState createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemList> {

  List<Products> items = [
    Products(
        id: 32,
        name: "Business Casual Work Outfit",
        price: 50,
        discountPrice: 25,
        description:
        "business-casual-dress-women-work-office-professional-outfit-essentials-miss-louie-57",
        quantity: 30,
        dateCreated: "2022-05-24 08:14:49",
        images: [
          "https://i.mydramalist.com/vK4lp_5f.jpg",
        ]),
    Products(
        id: 32,
        name: "Casual Work Outfit",
        price: 50,
        discountPrice: 25,
        description:
        "business-casual-dress-women-work-office-professional-outfit-essentials-miss-louie-57",
        quantity: 30,
        dateCreated: "2022-05-24 08:14:49",
        images: [
          "https://i.mydramalist.com/vK4lp_5f.jpg",
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Hello! Abishan",
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Text(
                    "Let's find the best products for you",
                    textAlign: TextAlign.start,
                  )
                ],
              ),
              // Container(
              //   alignment: Alignment.topRight,
              //   child: IconButton(
              //       onPressed: () {
              //         setState(() {
              //           Navigator.push(context, '/profile');
              //         });
              //       },
              //       icon: const FaIcon(
              //         FontAwesomeIcons.solidUser,
              //         size: 18,
              //       )),
              // ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: NetworkImage(
                    "https://i.mydramalist.com/vK4lp_5f.jpg",
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.height05),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(Dimensions.radius20),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.search,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search for products',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width45,
            ),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Carousel(
                images: [
                  Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor),
              textAlign: TextAlign.start,
            ),
          ),
          // Row(
          //   children: [
          //     ListView.builder(
          //         itemBuilder: (context,index) => CategoryItem(category: "Mens",)
          //     ),
          //   ],
          // )
          // Container(
          //
          //   child: ListView.builder(
          //     itemCount: 8,
          //       itemBuilder: (context,inde){
          //
          //         return Container(
          //           height: 100,
          //           child: Row(
          //             children: [
          //               Container(
          //                 width:50,
          //                 height: 50,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(Dimensions.radius20),
          //                   image:
          //                   DecorationImage(
          //                     image: AssetImage(
          //                         "assets/image/logo.png"
          //                     )
          //                   )
          //                 )
          //               )
          //             ],
          //           ),
          //
          //         );
          //       }),
          // ),
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/logo.png")))),
                        Text(
                          // info[index]['name'],
                          "Hello + ${index}",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: Dimensions.width10,)
                      ],
                    ),
                  );
                }),
          ),

          // Container(
          //   height: 60,
          //   child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: info.length,
          //       separatorBuilder: (context, _) => SizedBox(
          //         width: Dimensions.width10,
          //       ),
          //       itemBuilder: (_, i)  {
          //
          //         return Container(
          //           width: 160,
          //           height: 50,
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: 150,
          //                 height: 40,
          //                 // child: Image.network(info[i]['category_image']),
          //                 child: Image.asset('assets/image/logo.png',fit: BoxFit.cover,),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 info[i]['name'],
          //                 style: TextStyle(
          //                     fontSize: Dimensions.font20,
          //                     fontWeight: FontWeight.bold),
          //               )
          //             ],
          //           ),
          //         );
          //
          //       }),
          // ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Just For You ",
              style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: (info.length.toDouble() / 2).toInt(),
                itemCount: 8,
                itemBuilder: (context, i) {
                  int a = 2 * i;
                  int b = 2 * i + 1;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            top: Dimensions.height20,
                            bottom: Dimensions.height20),
                        // padding: EdgeInsets.all(Dimensions.height20),

                        child: Column(
                          children: [
                            Material(
                              child: InkWell(
                                child: Container(
                                  width: 120,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(
                                          Dimensions.radius15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/image/logo.png')),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(5, 5),
                                          color: AppColors.paraColor
                                              .withOpacity(0.1),
                                        ),
                                        BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(-5, -5),
                                          color: AppColors.paraColor
                                              .withOpacity(0.1),
                                        )
                                      ]),
                                ),
                                onTap: () {

                                }
                              ),
                            ),
                            Center(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    // info[a]['name']
                                      "Hello"
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        // padding: EdgeInsets.all(Dimensions.height20),
                        padding: EdgeInsets.only(
                          left: Dimensions.width30,
                          right: Dimensions.width30,
                          top: Dimensions.height20,
                        ),

                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/image/logo.png')),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: AppColors.paraColor
                                          .withOpacity(0.1),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: AppColors.paraColor
                                          .withOpacity(0.1),
                                    )
                                  ]),
                            ),
                            Center(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    // info[b]['name']
                                      "hello"
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      )
                    ],
                  );
                }),
          ),
        ],
      );
    // return Container(
    //   height: 60,
    //   child: ListView.builder(
    //       itemCount: 8,
    //       itemBuilder: (context,inde){
    //
    //         return Container(
    //           child: Row(
    //             children: [
    //               Container(
    //                   width:50,
    //                   height: 50,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(Dimensions.radius20),
    //                       image:
    //                       DecorationImage(
    //                           image: AssetImage(
    //                               "assets/image/logo.png"
    //                           )
    //                       )
    //                   )
    //               )
    //             ],
    //           ),
    //
    //         );
    //       }),
    // );
  }
}
