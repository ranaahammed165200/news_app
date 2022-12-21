import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/Screen/Reposetory/Auth_repo.dart';
import 'package:news_app/Screen/Homepage.dart';

import 'package:news_app/AppTheme/registration/SignUp.dart';
import 'package:news_app/AppTheme/registration/forget_password.dart';
import 'package:news_app/Screen/bottomnavigation.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back 👋',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        'I am happy to see you again. You can continue where you left off by logging in',
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 32,
                    ),
                    AppTextField(
                      controller: emailcontroller,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: 'Email Address',
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
                      controller: passwordcontroller,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password',
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password?',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().greyPrimary)),
                    ).onTap(() => const ForgetPassword().launch(context)),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () async {
                        if (emailcontroller.text.isEmpty) {
                          toast('Please Enter your email');
                        } else if (passwordcontroller.text.length < 6) {
                          toast('Password short please full password');
                        } else {
                          try {
                            EasyLoading.show(status: 'Signing in');
                            bool status = await AuthRepo().signInWithEmail(
                                emailcontroller.text, passwordcontroller.text);
                            if (status) {
                              EasyLoading.showSuccess('Sign In Successful');
                              MainHomePage().launch(context);
                            } else {
                              EasyLoading.showError(
                                  'Email or password is wrong');
                            }
                          } catch (e) {
                            EasyLoading.showError(e.toString());
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ThemeColors().purplePrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'or',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().greyPrimary),
                        )),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeColors().white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: ThemeColors().greyLighter, width: 2)),
                      child: Row(
                        children: [
                          const Image(
                              height: 24,
                              width: 24,
                              image: AssetImage('images/google-logo.png')),
                          const SizedBox(
                            width: 52,
                          ),
                          Text(
                            'Sign in with Google',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 16, color: ThemeColors().greyDarker),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //Sign In with Facebook Button
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeColors().white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: ThemeColors().greyLighter, width: 2)),
                      child: Row(
                        children: [
                          const Image(
                              height: 24,
                              width: 24,
                              image: AssetImage(
                                'images/facebook-logo.png',
                              )),
                          const SizedBox(
                            width: 52,
                          ),
                          Text(
                            'Sign In with Facebook',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 16, color: ThemeColors().greyDarker),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().blackLighter),
                        ),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              color: ThemeColors().blackPrimary,
                              fontWeight: FontWeight.w600),
                        ).onTap(() => SignUp().launch(context))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
