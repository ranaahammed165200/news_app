import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';

import 'package:news_app/Extra/slider.dart';
import 'package:news_app/Screen/welcomepage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 79.0)),
        Column(
          children: [
            const SlidersScreen(),
            const SizedBox(
              height: 34.0,
            ),
            Text(
              'First to know',
              style: TextStyle(
                  color: ThemeColors().blackPrimary,
                  fontSize: 20,
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
          height: 64,
        ),
        Container(
          alignment: Alignment.center,
          width: 336,
          height: 56,
          decoration: BoxDecoration(
              color: ThemeColors().purplePrimary,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Next',
            style: GoogleFonts.sourceSansPro(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ).onTap(() => WelcomePage().launch(context))
      ],
    )));
  }
}
