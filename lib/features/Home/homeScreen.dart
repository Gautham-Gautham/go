import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../splash/splashScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h * 0.45,
            color: Colors.blueAccent,
            width: w,
            child: Stack(children: [
              Positioned(
                  bottom: h * 0.0,
                  child: Image(
                    image: AssetImage(
                      "assets/24195968_6874638-removebg-preview.png",
                    ),
                    height: h * 0.35,
                  )),
              Positioned(
                  top: h * 0.05,
                  left: w * 0.2,
                  child: Text(
                    "Avoid the Scare",
                    style: GoogleFonts.poppins(
                        fontSize: w * 0.08, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: h * 0.09,
                  right: w * 0.05,
                  child: Text(
                    "of Corona",
                    style: GoogleFonts.poppins(
                        fontSize: w * 0.08, fontWeight: FontWeight.bold),
                  ))
            ]),
          ),
          Container(
            height: h * 0.55,
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Symptoms",
                    style: GoogleFonts.poppins(fontSize: w * 0.07),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: h * 0.18,
                        width: w * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/coldd.png",
                              height: h * 0.4,
                              width: w * 0.2,
                            ),
                            Text(
                              "Cold",
                              style: GoogleFonts.poppins(fontSize: w * 0.06),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: h * 0.18,
                        width: w * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              "  Cough",
                              style: GoogleFonts.poppins(fontSize: w * 0.06),
                            ),
                            Image.asset(
                              "assets/cougs.png",
                              height: h * 0.2,
                              width: w * 0.2,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: h*0.03,),
                Center(
                  child: Container(
                    height: h*0.24,
                    width: w*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Column(
                          children: [
                            SizedBox(height: h*0.06,),
                            Text("Avoid the Scare of\n     Corona",style: GoogleFonts.poppins(fontSize: w*0.05),),
                            SizedBox(height: h*0.02,),
                            Container(width: w*0.35,
                            height: h*0.06,decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(25),

                              ),child: Center(
                                child: Text(
                                    'Call',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: w * 0.04,
                                        fontWeight: FontWeight.normal),
                                  ),
                              ),)
                          ],
                        ),
                        Image.asset("assets/coronavirus-removebg-preview.png",height: h*0.16,)
                      ],),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
