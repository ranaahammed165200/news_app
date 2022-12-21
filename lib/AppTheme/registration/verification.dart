import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/AppTheme/registration/new_password.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification Code ✅',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().blackPrimary, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'You need to enter 4-digit code we send to your email adress.',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().greyPrimary, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          height: 72,
                          width: 72,
                          textStyle: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              color: ThemeColors().blackPrimary,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                              color: ThemeColors().greyLighter,
                              borderRadius: BorderRadius.circular(10))),
                      focusedPinTheme: PinTheme(
                        height: 72,
                        width: 72,
                        textStyle: GoogleFonts.sourceSansPro(
                            color: ThemeColors().purplePrimary),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: ThemeColors().purplePrimary)),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeColors().purplePrimary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Confirm',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16, color: ThemeColors().white),
                      ),
                    ).onTap(() => NewPassword().launch(context)),
                    const SizedBox(
                      height: 380,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t receive an email?',
                          style: GoogleFonts.sourceSansPro(
                              color: ThemeColors().blackLighter,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Send again',
                          style: GoogleFonts.sourceSansPro(
                              color: ThemeColors().blackPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
