import 'package:flutter/material.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/routing_extenstion.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/global/custom_button.dart';
import 'package:flutter_doctors/core/router/route_name.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:flutter_doctors/core/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* text
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                color: AppColors.fourthColor,
                fontSize: 40,
              ),
            ),
            (context.height / 40).ph,
            //* image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Images.thirdImage),
            ),
            //* text
            Text(
              "THE TASTE OF JAPANESE FOOD ",
              style: GoogleFonts.dmSerifDisplay(
                color: AppColors.fourthColor,
                fontSize: 40,
              ),
            ),
            (context.height / 40).ph,
            Text(
              "Feal the taste of most popular japanese food  froe anywhere and anytime ",
              style: GoogleFonts.dmSerifDisplay(
                color: AppColors.lightGrey,
              ),
            ),
            (context.height / 40).ph,
            //* button

            buildCustomButton(
                title: "Get Started",
                context: context,
                onTap: () => context.go(
                      routeName: RoutesNames.home,
                      replacement: true,
                    )),
          ],
        ),
      )),
    );
  }
}
