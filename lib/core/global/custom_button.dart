import 'package:flutter/material.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/extension/sized_box.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';

Widget buildCustomButton({
  required String title,
  required Function()? onTap,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.thirdColor.withAlpha(
              20,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.fourthColor),
              ),
              (context.width / 25).pw,
              Icon(
                Icons.arrow_forward,
                color: AppColors.fourthColor,
              )
            ],
          ),
        ),
      ),
    );
