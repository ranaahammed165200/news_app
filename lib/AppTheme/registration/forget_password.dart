import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/AppTheme/registration/verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password 🤔',
                        style: GoogleFonts.sourceSansPro(
                            color: ThemeColors().blackPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'We need your email adress so we can send you the password reset code.',
                        style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().greyPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _textController,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: 'Email Address',
                            suffixIcon: _textController.value != null
                                ? IconButton(
                                    onPressed: () {
                                      _textController.clear();
                                    },
                                    icon: Icon(Icons.clear))
                                : null,
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
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ],
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
                    'Next',
                    style: GoogleFonts.sourceSansPro(
                        color: ThemeColors().white, fontSize: 16),
                  ),
                ).onTap(() => Verification().launch(context)),
                const SizedBox(
                  height: 418,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember the password?',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().blackPrimary, fontSize: 16),
                    ),
                    Text(
                      'Try Again',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().blackPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
