import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/AppTheme/registration/signin.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create New Password 🔒',
                        style: GoogleFonts.sourceSansPro(
                            color: ThemeColors().blackPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                        'You can create a new password, please dont forget it too.',
                        style: GoogleFonts.sourceSansPro(
                            color: ThemeColors().greyPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 32,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          hintText: 'New Password',
                          hintStyle: GoogleFonts.sourceSansPro(
                              color: ThemeColors().greyPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          filled: true,
                          fillColor: ThemeColors().greyLighter,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Repeat New Password',
                          hintStyle: GoogleFonts.sourceSansPro(
                              color: ThemeColors().greyPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          filled: true,
                          fillColor: ThemeColors().greyLighter,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 32,
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
                            color: ThemeColors().white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 340,
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
                        ).onTap(() => SignIn().launch(context))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
