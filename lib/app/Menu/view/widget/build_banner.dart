import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/global/custom_button.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:flutter_doctors/core/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildBanner({required BuildContext context}) => Container(
      width: double.infinity,
      height: context.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark ? AppColors.softDark : AppColors.lightGrey,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //* text
                Text(
                  "Gete 30% promo",
                  style: GoogleFonts.dmSerifDisplay(color: AppColors.fourthColor, fontSize: 18),
                ),
                (context.height / 50).ph,
                //* button
                buildCustomButton(
                  title: "Read more",
                  context: context,
                  onTap: () {},
                ),
              ],
            ),
          ),
          //* Image
          Image.asset(
            Images.fifthImage,
            height: 100,
          )
        ],
      ),
    );
