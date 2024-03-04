import 'dart:async';

import 'package:alnasheet/view/const.dart';
import 'package:alnasheet/view/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString("uid");
    var userToken = pref.getString("utoken");
    if(userId == null && userToken == null){
      Timer(
        Duration(seconds: 3),
            () => LoginScreen().launch(context,pageRouteAnimation: PageRouteAnimation.Slide,isNewTask: true),
      );
    }else{
      Timer(
        Duration(seconds: 3),
            () => DashboardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.Slide,isNewTask: true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/bg_image.png"),fit: BoxFit.fill)
            ),
          ),
          SafeArea(
            child: Image(image: AssetImage("assets/gifs/Alnsheet.gif"),),
          ),]
      ),
    );
  }
}
