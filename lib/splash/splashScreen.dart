import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_corona/features/Home/homeScreen.dart';
import 'package:go_corona/features/auth/screens/login.dart';
import 'package:go_corona/features/auth/screens/signUp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/controller/controller.dart';

double h = 0.0;
double w = 0.0;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool loging = false;

  keepLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("key")) {
      final id=prefs.getString("key");
      ref.read(authControllerProvider.notifier).getUserData(id!);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            child: Column(
          children: [
            Lottie.asset("assets/openScreen.json"),
            Text(
              "Ready to Feast?",
              style: GoogleFonts.poppins(
                  color: Colors.blueAccent,
                  fontSize: w * 0.09,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Let,s Begin",
              style: GoogleFonts.poppins(
                  color: Colors.blueAccent,
                  fontSize: w * 0.09,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                keepLogin();
              },
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.normal),
              ),
            )
            // ElevatedButton.icon(
            //   onPressed: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
            //   },
            //   icon: Icon(CupertinoIcons.back,color: Colors.transparent,),
            //   label:  Text('Get Started',style: GoogleFonts.poppins(color: Colors.white,fontSize:w*0.04 ,fontWeight: FontWeight.normal),),
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       minimumSize:const Size(double.infinity, 50),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(40)
            //       )
            //   ),
            // ),

            )
      ]),
    );
  }
}
