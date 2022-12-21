import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/Screen/Reposetory/Auth_repo.dart';
import 'package:news_app/AppTheme/registration/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
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
                      'Welcome to Nuntium 👋',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().blackPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Hello, I guess you are new around here. You can start using the application after sign up.',
                      style: GoogleFonts.sourceSansPro(
                          color: ThemeColors().greyPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppTextField(
                      controller: firstnamecontroller,
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_rounded),
                          hintText: 'Enter Your First Name..',
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
                      controller: lastnamecontroller,
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_rounded),
                          hintText: 'Enter Your Last Name...',
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
                      controller: emailcontroller,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_rounded),
                          hintText: 'Email Adress',
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
                      controller: phonecontroller,
                      textFieldType: TextFieldType.PHONE,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_rounded),
                          hintText: 'Phone Number',
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
                          prefixIcon: const Icon(Icons.lock_outline),
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
                    AppTextField(
                      controller: confirmpasswordcontroller,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: ' Confirm Password',
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
                    InkWell(
                      onTap: () async {
                        if (firstnamecontroller.text.isEmpty) {
                          EasyLoading.show(
                              status: 'Please Enter Your First Name');
                        } else if (lastnamecontroller.text.isEmpty) {
                          toast('Please Enter your Last Name');
                        } else if (emailcontroller.text.isEmpty) {
                          toast('Please Enter Your Email');
                        } else if (phonecontroller.text.isEmpty) {
                          toast('Please Enter Your Phone Number');
                        } else if (passwordcontroller.text.length < 6) {
                          toast('password At least 6 digit');
                        } else if (confirmpasswordcontroller.text.isEmpty) {
                          toast('Please Enter Your Confirm Password');
                        } else {
                          try {
                            EasyLoading.show(status: 'Signing in');
                            bool status = await AuthRepo().signupcall(
                                firstnamecontroller.text,
                                lastnamecontroller.text,
                                emailcontroller.text,
                                phonecontroller.text,
                                passwordcontroller.text,
                                confirmpasswordcontroller.text);
                            if (status) {
                              EasyLoading.showSuccess('Signing in Successfull');
                              SignIn().launch(context, isNewTask: true);
                            } else {
                              toast('Something is worng');
                              EasyLoading.dismiss();
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
                          'Sign Up',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16, color: ThemeColors().blackLighter),
                        ),
                        Text(
                          'Sign In',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              color: ThemeColors().blackPrimary,
                              fontWeight: FontWeight.w600),
                        ).onTap(() => const SignIn().launch(context))
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
