import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/Menu/model/settings_item.dart';
import 'package:flutter_doctors/core/database/boxes_names.dart';
import 'package:flutter_doctors/core/database/keys_names.dart';
import 'package:flutter_doctors/core/themes/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<SettingItem> settingsItems = [
  SettingItem(
    circleColor: AppColors.grey,
    icon: Icons.dark_mode,
    title: "Dark Mode",
    subtitle: "Change the mode to the dark mode",
    action: () {},
    trailing: ValueListenableBuilder(
      valueListenable: Hive.box(BoxesNames.settings).listenable(),
      builder: (BuildContext context, Box box, Widget? child) {
        final isDarkMode = box.get(KeysNames.darkMode, defaultValue: false);
        return Switch(
          value: isDarkMode,
          activeColor: AppColors.grey,
          onChanged: (value) {
            box.put(KeysNames.darkMode, value);
          },
        );
      },
    ),
  ),
  SettingItem(
    circleColor: AppColors.primaryColor,
    icon: Icons.abc,
    hasFaIcon: true,
    faIcon: FaIcon(
      FontAwesomeIcons.google,
      color: AppColors.softGrey,
    ),
    title: "Mail",
    subtitle: "Send an e-mail",
    action: () async {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'ismailtodoapp@gmail.com',
        query: encodeQueryParameters(
          <String, String>{
            'subject': 'Hello from Shop app',
            'body': "I'am using the app and it's very Good !"
          },
        ),
      );
      if (await canLaunchUrl(emailUri)) {
        launchUrl(emailUri);
      } else {}
    },
  ),
  SettingItem(
    circleColor: AppColors.pink,
    icon: Icons.abc,
    hasFaIcon: true,
    faIcon: FaIcon(
      FontAwesomeIcons.instagram,
      color: AppColors.softGrey,
    ),
    title: "Instagram",
    subtitle: "Find me on instagram",
    action: () async {
      final url = Uri.parse('https://www.instagram.com/ismailabboud0');
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      } else {}
    },
  ),
];
