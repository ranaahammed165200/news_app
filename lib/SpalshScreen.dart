import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/Screen/bottomnavigation.dart';

import 'package:news_app/AppTheme/registration/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goScreen() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token.isEmptyOrNull) {
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => const SignIn().launch(context));
    } else {
      await Future.delayed(const Duration(seconds: 3)).then(
          (value) => const MainHomePage().launch(context, isNewTask: true));
    }
  }

  @override
  void initState() {
    goScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: ThemeColors().purplePrimary,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            // child: const Image(image: AssetImage('images/logo.png')),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              child: Image.asset(
                'images/newsphoto.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
