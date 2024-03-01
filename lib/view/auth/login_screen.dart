import 'dart:convert';

import 'package:alnasheet/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/auth/forgotpass_screen.dart';
import 'package:alnasheet/view/presentation/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  void loginToDashboard(BuildContext context,TextEditingController username,TextEditingController password)async{
    Object body={"username":username.text.toString(),"password":password.text.toString() ,"gcm_id":"1234555" };
    http.Response response;
    response= await http.post(Uri.parse(""),
    body: jsonEncode(body),
    );
    Map responseData=jsonDecode(response.body);
    if(responseData["result"]["success"]==1){
      DashboardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.Slide);
      toast(responseData["result"]["message"]);
      await setValue(ConstData.CURRENT_USER, responseData["result"]["data"]);
    }else{
      toast(responseData["result"]["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children:[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/bg_image.png"),fit: BoxFit.fill)
                ),
              ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/Al.Nasheet-logo.png",
                      width: 250,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text(
                              "Login!",
                              style: GoogleFonts.lato(
                                  color: Color(0xFF222B65),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text("Username",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 7,),
                              TextFormField(
                                // controller: value.usernameController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  prefixIcon: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      FaIcon(
                                        FontAwesomeIcons.user,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  hintText: "Username",
                                  hintStyle: GoogleFonts.nunito(color: Colors.grey),
                                ),
                              ),
                                  SizedBox(height: 15,),
                                  Text("Password",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 7,),
                              TextFormField(
                                // controller: value.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: Colors.black,
                                // obscureText: value.securePass,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  // suffix: InkWell(
                                  //   onTap: () {
                                  //     // value.showPass();
                                  //   },
                                  //   child:FaIcon(value.securePass? FontAwesomeIcons.solidEye:FontAwesomeIcons.solidEyeSlash,size: 15,color: Colors.grey,),
                                  // ),
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.nunito(color: Colors.grey),
                                ),
                              ),
                                  SizedBox(height: 10,),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, PageTransition(child: ForgotPassScreen(), type: PageTransitionType.rightToLeft));
                                          },
                                          child: Text("Forgot Password?",style: GoogleFonts.lato(color: Color(0xFF222B65)),))),
                                  SizedBox(height: 25,),
                                  InkWell(
                                    onTap: () {
                                      // loginToDashboard(context,loginScreenProvider.usernameController, loginScreenProvider.passwordController);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color(0xFF222B65)),
                                      child:  Text(
                                        "Log In",
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
        ]
        ),
      ),
    );
  }
}
