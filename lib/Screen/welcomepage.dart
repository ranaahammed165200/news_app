import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';

import 'package:news_app/AppTheme/registration/signin.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 154),
              height: 272,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/welcome.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              children: [
                Text(
                  'Latest News',
                  style: TextStyle(
                      color: ThemeColors().blackPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 216,
              child: Text(
                'All news in one place, be the first to know last news',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeColors().greyPrimary,
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 336,
              height: 56,
              decoration: BoxDecoration(
                  color: ThemeColors().purplePrimary,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Get Started',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ).onTap(() => SignIn().launch(context))
          ],
        ));
  }
}
