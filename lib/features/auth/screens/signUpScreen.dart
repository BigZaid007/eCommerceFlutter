import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:zero/features/auth/screens/loginScreen.dart';
import 'package:zero/features/auth/services/auth_service.dart';

import '../../../global_varibales/global.dart';
import '../widgets/inputField.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
final formkey = GlobalKey<FormState>();
AuthService authService = AuthService();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child:   Container(
              width: MediaQuery.of(context).size.width,
              height: 900,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.grey[200]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset('images/signup.svg',width: 260,height: 260,),
                    ),
                    Text('Register New Account',style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                    const SizedBox(
                      height: 7,
                    ),
                    const SizedBox(
                      height: 12,
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
                      controller: email,
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
                      controller: password,
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
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          authService.signUpUser(
                              name: name.text,
                              email: email.text,
                              password: password.text, context: context);

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
                          'Sign up',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('''Or Sign up with''',style: TextStyle(
                            color: Colors.grey[600]
                          ),),
                        ],
                      ),
                    ),
                    SocialLoginButton(
                      text: 'Sign Up with Google',
                      borderRadius: 15,
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('''Already have an account?'''),
                          SizedBox(
                            width: 3,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => authScreen()));
                            },
                            child: Text(
                              'Login',
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
    );
  }
}


