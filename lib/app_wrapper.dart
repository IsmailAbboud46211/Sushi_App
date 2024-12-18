import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doctors/app/intro/view/intro_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    //* To kepp Device orientation portraitUp
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return const IntroScreen();
  }
}
