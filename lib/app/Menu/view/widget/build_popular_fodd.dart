import 'package:flutter/material.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:flutter_doctors/core/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPopularFodd extends StatelessWidget {
  const BuildPopularFodd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark ? AppColors.softDark : AppColors.lightGrey,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
        color: Theme.of(context).brightness == Brightness.dark ? AppColors.softDark : AppColors.softWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* image
            Image.asset(
              Images.fourthImage,
              height: 100,
            ),
            (context.height / 25).pw,
            //* name + price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Salmon Sushi",
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "\$25",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //* icon
            Icon(
              Icons.favorite_border_outlined,
              color: AppColors.thirdColor,
            )
          ],
        ),
      ),
    );
  }
}
