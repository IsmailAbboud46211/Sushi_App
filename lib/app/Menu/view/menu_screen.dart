import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/model/food_model.dart';
import 'package:flutter_doctors/app/Menu/view/widget/build_banner.dart';
import 'package:flutter_doctors/app/Menu/view/widget/build_drawer.dart';
import 'package:flutter_doctors/app/Menu/view/widget/build_popular_fodd.dart';
import 'package:flutter_doctors/app/Menu/view/widget/food_tile.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/routing_extenstion.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/router/route_name.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:flutter_doctors/core/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  List<FoodModel> foods = [
    //* salmon
    FoodModel(
      name: "Salmon egg",
      imagePath: Images.firstImage,
      price: 22,
      rating: "4.5",
    ), //* salmon
    FoodModel(
      name: "Tuna",
      imagePath: Images.secondImage,
      price: 40,
      rating: "4.9",
    ), //* salmon
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: const BuildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Menu",
          style: GoogleFonts.dmSerifDisplay(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.cart,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* banner
            buildBanner(context: context),

            (context.height / 25).ph,
            //* search text field

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.softDark
                        : AppColors.lightGrey,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ],
                color: AppColors.softWhite,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Find what you want ...",
                    hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.softDark
                          : AppColors.lightGrey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.softDark
                              : AppColors.seconderyColor,
                        ))),
              ),
            ),
            (context.height / 25).ph,
            //* menu
            Text(
              "Food Menu",
              style: GoogleFonts.dmSerifDisplay(
                color: AppColors.primaryColor,
                fontSize: 20,
              ),
            ),
            (context.height / 25).ph,

            //* List of items
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => FoodTile(
                  foodModel: foods[index],
                  onTap: () => context.go(
                    routeName: RoutesNames.productInfo,
                    arguments: foods[index],
                  ),
                ),
                separatorBuilder: (context, index) => (context.height / 15).ph,
                itemCount: foods.length,
              ),
            ),
            (context.height / 25).ph,
            //* popular food
            const BuildPopularFodd(),
          ],
        ),
      ),
    );
  }
}
