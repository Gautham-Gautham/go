import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_corona/features/auth/screens/signUp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils.dart';
import '../../../splash/splashScreen.dart';
import '../controller/controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  FocusNode lf1 = FocusNode();
  FocusNode lf2 = FocusNode();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(authControllerProvider);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: h * 0.75,
            width: w,
            // color: Colors.red,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Lottie.asset("assets/log.json",
                              height: w * 0.5, width: w * 0.5),
                          Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: w * 0.09,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.1),
                  child: Row(
                    children: [
                      Text(
                        "User Name:",
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.1, top: h * 0.01),
                  child: Row(
                    children: [
                      SizedBox(
                          height: h * 0.07,
                          width: w * 0.8,
                          child: TextFormField(
                            focusNode: lf1,
                            autofocus: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: uname,
                            onTap: () {
                              pass.clear();
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.person,
                                    color: Colors.blue.shade300),
                                hintText: "abc@gmail.com",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: w * 0.03, color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue.shade100,
                                    width: 2.0,
                                  ),
                                ),
                                fillColor: Colors.lightBlue.shade100,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                            onFieldSubmitted: (value) {
                              print(value);
                              FocusScope.of(context).requestFocus(lf2);
                            },
                            // validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //           .hasMatch(value)) {
                            //     return 'Enter a valid email!';
                            //   }
                            //   return null;
                            // },
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.1),
                  child: Row(
                    children: [
                      Text(
                        "Password:",
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.1, top: h * 0.01),
                  child: Row(
                    children: [
                      SizedBox(
                          height: h * 0.07,
                          width: w * 0.8,
                          child: TextFormField(
                            focusNode: lf2,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            controller: pass,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.person,
                                    color: Colors.blue.shade300),
                                hintText: "***************",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: w * 0.03, color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue.shade100,
                                    width: 2.0,
                                  ),
                                ),
                                fillColor: Colors.lightBlue.shade100,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.01),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                      },
                      child: Text(
                        "Don't have any account?",
                        style: GoogleFonts.poppins(color: Colors.blueAccent),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: h * 0.25,
            width: w,
            // color: Colors.blueAccent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: w * 0.4,
                        child: Divider(
                          height: h * 0.01,
                          color: Colors.blueAccent,
                        )),
                    Text(
                      "or",
                      style: GoogleFonts.poppins(color: Colors.blueAccent),
                    ),
                    Container(
                        width: w * 0.4,
                        child: Divider(
                          height: h * 0.01,
                          color: Colors.blueAccent,
                        )),
                  ],
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : InkWell(
                        onTap: () {
                          ref
                              .watch(authControllerProvider.notifier)
                              .signInWithGoogle(context);
                        },
                        child: Container(
                          height: w * 0.13,
                          width: w * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.lightBlue.shade100, width: 2.5),
                          ),
                          child: Center(
                              child: Text(
                            "G",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.07),
                          )),
                        ),
                      ),
                Consumer(
                  builder: (context, ref, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: h * 0.02, left: w * 0.04, right: w * 0.04),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          if(uname.text.isEmpty){
                            showSnackBar(context, "Enter a valid email..");
                          }else if(pass.text.isEmpty){
                            showSnackBar(context, "Enter a valid password..");
                          }else{
                            ref
                                .read(authControllerProvider.notifier)
                                .getAgentlogin(
                                email: uname.text.trim(),
                                pass: pass.text.trim(),
                                context: context);
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
