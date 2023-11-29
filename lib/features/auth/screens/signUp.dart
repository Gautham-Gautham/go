import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_corona/Model/user.dart';
import 'package:go_corona/core/providers/firebaseProviders.dart';
import 'package:go_corona/core/utils.dart';
import 'package:go_corona/features/Home/homeScreen.dart';
import 'package:go_corona/features/auth/screens/login.dart';
import 'package:go_corona/splash/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController usname = TextEditingController();
  TextEditingController pass = TextEditingController();
  FocusNode lf1 = FocusNode();
  FocusNode lf2 = FocusNode();
  FocusNode lf3 = FocusNode();
  FocusNode lf4 = FocusNode();
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: h * 0.75,
              width: w,
              // color: Colors.red,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Lottie.asset("assets/signUp.json",
                              height: w * 0.5, width: w * 0.5),
                          Text(
                            "Join Us!",
                            style: GoogleFonts.poppins(
                                fontSize: w * 0.09,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.1),
                    child: Row(
                      children: [
                        Text(
                          "Your name:",
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
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                print(value);
                                FocusScope.of(context).requestFocus(lf2);
                              },
                              focusNode: lf1,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              controller: name,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.person,
                                      color: Colors.blue.shade300),
                                  hintText: "Enter Your FullName",
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
                            //   validator: (value) {
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
                          "Mobile No:",
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
                              onFieldSubmitted: (value) {
                                print(value);
                                FocusScope.of(context).requestFocus(lf3);
                              },
                              focusNode: lf2,
                              controller: ph,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.person,
                                      color: Colors.blue.shade300),
                                  hintText: "Mobile Number",
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
                            ))
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
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                print(value);
                                FocusScope.of(context).requestFocus(lf4);
                              },
                              focusNode: lf3,
                              controller: usname,
                              decoration: InputDecoration(
                                  hintText: "hello@gmail.com",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: w * 0.03, color: Colors.grey),
                                  suffixIcon: Icon(
                                    CupertinoIcons.location_fill,
                                    color: Colors.blue.shade300,
                                  ),
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
                              obscureText: obscureText,
                              focusNode: lf4,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              controller: pass,
                              decoration: InputDecoration(
                                  hintText: "***********************",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: w * 0.03, color: Colors.grey),
                                  suffixIcon:IconButton(onPressed: () {
                                    toggle();
                                  }, icon:obscureText? Icon(CupertinoIcons.lock_fill,
                                    color: Colors.blue.shade300,):Icon(CupertinoIcons.lock_open_fill,
                                    color: Colors.blue.shade300,)),

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
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter a valid password!';
                              //   }
                              //   return null;
                              // },
                            ))
                      ],
                    ),
                  ),

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
                  InkWell(onTap: () => ref.watch(authControllerProvider.notifier).signInWithGoogle(context),
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
                            fontWeight: FontWeight.bold, fontSize: w * 0.07),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.02, left: w * 0.04, right: w * 0.04),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {
                        // if()
                     if(name.text.isEmpty||usname.text.isEmpty||pass.text.isEmpty||ph.text.isEmpty){

                       showSnackBar(context, "fill the fields above ..!");

                     }else{
                       UserModel user=   UserModel(name: name.text.trim(), num: ph.text.trim(), email: usname.text.trim(),
                           password: pass.text.trim(), id: "");
                       ref.read(fireStroeProvider).collection("user").add(user.toMap()).then((value) {
                         value.update({"id": value.id});
                       });
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => HomeScreen(),
                           ));
                     }

                      },
                      child: Text(
                        'Create an Account',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
