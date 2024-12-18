import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/model/food_model.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final FoodModel foodModel;
  final Function()? onTap;
  const FoodTile({super.key, required this.foodModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).brightness == Brightness.dark ? AppColors.softDark : AppColors.lightGrey,
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
          color: Theme.of(context).brightness == Brightness.dark ? AppColors.softDark : AppColors.softWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //* image
                Image.asset(
                  foodModel.imagePath,
                  height: 100,
                ),
                //* text
                Text(
                  foodModel.name,
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${foodModel.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    (context.width / 10).pw,
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                    ),
                    Text(
                      " ${foodModel.rating}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
