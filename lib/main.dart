import 'package:flutter/material.dart';
import 'package:flutter_doctors/app/cart/data/model/shop_model.dart';
import 'package:flutter_doctors/app_wrapper.dart';
import 'package:flutter_doctors/core/database/boxes_names.dart';
import 'package:flutter_doctors/core/database/hive_db.dart';
import 'package:flutter_doctors/core/database/keys_names.dart';
import 'package:flutter_doctors/core/router/app_router.dart';
import 'package:flutter_doctors/core/themes/dark_theme.dart';
import 'package:flutter_doctors/core/themes/light_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

//* global var to access to the DB from anyWhere
HiveDB hiveDB = HiveDB();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* init the local DB
  await hiveDB.initDB();
  //* Router
  AppRouter appRouter = AppRouter();

  runApp(ChangeNotifierProvider(
    create: (context) => ShopModel(),
    child: SushiResturantApp(
      appRouter: appRouter,
    ),
  ));
}

class SushiResturantApp extends StatelessWidget {
  final AppRouter appRouter;
  const SushiResturantApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(BoxesNames.settings).listenable(),
      builder: ((BuildContext context, Box box, Widget? child) {
        final isDarkMode = box.get(
          KeysNames.darkMode,
          defaultValue: false,
        );
        return MaterialApp(
          title: 'Sushi App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGeneratedRoutes,
          theme: isDarkMode ? DarkTheme.setDarkMode() : LightTheme.setLightMode(),
          home: const AppWrapper(),
        );
      }),
    );
  }
}
