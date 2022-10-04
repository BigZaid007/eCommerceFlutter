import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import 'package:zero/features/auth/screens/signUpScreen.dart';
import 'package:zero/features/auth/services/auth_service.dart';
import 'package:zero/features/auth/widgets/inputField.dart';
import 'package:zero/global_varibales/global.dart';

class authScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  @override
  _authScreenState createState() => _authScreenState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
final formKey = GlobalKey<FormState>();
AuthService authService = AuthService();

class _authScreenState extends State<authScreen> {
  @override
  // TextEditingController _emailController= TextEditingController();
  // TextEditingController _passController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: goColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child:   Container(
                width: MediaQuery.of(context).size.width,
                height: 900,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                        child: SvgPicture.asset('images/login.svg',width: 220,height: 200,),
                      ),
                      Text('Getting Started',style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                      ),),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text('Email or Phone Number',style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w800
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                            fillColor: Colors.white,
                            hintText: 'example@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            )
                        ),
                        validator: (val)
                        {
                          if(val ==null || val.isEmpty) {

                            return 'This Field Cannot Be Empty';
                          }
                        },
                      ),
                      SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text('Password',style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w800
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '********',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            )
                        ),
                        validator: (val)
                        {
                          if(val ==null || val.isEmpty) {

                            return 'This Field Cannot Be Empty';
                          }
                        },
                      ),
                      SizedBox(height: 3,),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Text('Forget Password?',style: GoogleFonts.roboto(
                          color: goColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                        ),),
                      ),
                      SizedBox(height: 25,),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print('tap before');
                            authService.signInUser(
                                context: context,
                                email: _emailController.text,
                                password: _passController.text);
                            print('tap after');
                          }
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: goColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Or Sign in with''',style: TextStyle(
                                color: Colors.grey[600]
                            ),),
                          ],
                        ),
                      ),
                      SocialLoginButton(
                        text: 'Sign in with Google',
                        borderRadius: 15,
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () {},
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Don't you have an account?'''),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: Text(
                                'Create new Account',
                                style: TextStyle(color: goColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ),
            ),
          ),
        ),
      );

  }
}
