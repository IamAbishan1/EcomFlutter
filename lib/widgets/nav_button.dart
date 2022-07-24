import 'package:ecom/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.onBottomChanged, this.selectedIndex = 0})
      : super(key: key);

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xff27453D);
  final errorColor = const Color(0xffEF4444);

  final Function(int) onBottomChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 65,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconBottomBar(
                      text: "Home",
                      icon: FontAwesomeIcons.home,
                      selected: selectedIndex == 0 ? true : false,
                      onPressed: () {
                        onBottomChanged(0);
                      }),

                ],

              ),
              IconBottomBar(
                  text: "Category",
                  icon: FontAwesomeIcons.compressArrowsAlt,
                  selected: selectedIndex == 1 ? true : false,
                  onPressed: () {
                    onBottomChanged(1);
                  }),
              IconBottomBar(
                  text: "WishList",
                  icon: FontAwesomeIcons.solidHeart,
                  selected: selectedIndex == 2 ? true : false,
                  onPressed: () {
                    onBottomChanged(2);
                  }),
              IconBottomBar(
                  text: "Cart",
                  icon: FontAwesomeIcons.shoppingCart,
                  selected: selectedIndex == 3 ? true : false,
                  onPressed: () {
                    onBottomChanged(3);
                  }),
              IconBottomBar(
                  text: "Order",
                  icon: FontAwesomeIcons.history,
                  selected: selectedIndex == 4 ? true : false,
                  onPressed: () {
                    onBottomChanged(4);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 14,
            color: selected ? AppColors.mainColor : Colors.black,
          ),
        ),
        Text(text,

          style: TextStyle(
              fontSize: 10,
            color: selected ? AppColors.mainColor : Colors.black,

          ),)
      ],
    );
    // return SizedBox.fromSize(
    //   size: Size(56, 56), // button width and height
    //   child: ClipOval(
    //     child: Material(
    //       color: Colors.orange, // button color
    //       child: InkWell(
    //         splashColor: Colors.green, // splash color
    //         onTap: () {}, // button pressed
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Icon(Icons.call), // icon
    //             Text("Call"), // text
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}