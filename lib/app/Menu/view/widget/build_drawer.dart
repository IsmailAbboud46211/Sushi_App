import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/data/settings_data.dart';
import 'package:flutter_doctors/core/extension/media_query.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                child: Icon(
                  Icons.person_2_outlined,
                  size: 50,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              accountName: Text(
                "Dear user",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.width / 25,
                ),
              ),
              accountEmail: const Text(
                "ismail**@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: context.height / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => settingsItems[index],
                separatorBuilder: (context, index) => const Divider(),
                itemCount: settingsItems.length,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Center(child: Text("Sushi resturant app version 1.0")),
          )
        ],
      ),
    );
  }
}
