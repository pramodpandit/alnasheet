import 'dart:convert';

import 'package:alnasheet/bloc/authBloc.dart';
import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:alnasheet/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/auth/forgotpass_screen.dart';
import 'package:alnasheet/view/presentation/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../Utils/message_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc authBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc =AuthBloc(context.read<AuthRepository>());
    authBloc.msgController?.stream.listen((event) {
      AppMessageHandler().showSnackBar(context, event);
    });
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
                                controller: authBloc.username,
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
                              ValueListenableBuilder(
                                valueListenable: authBloc.securePassword,
                                builder: (context, securePassword, child) {
                                return TextFormField(
                                  controller: authBloc.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: Colors.black,
                                  obscureText: securePassword,
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
                                    suffix: InkWell(
                                      onTap: () {
                                        authBloc.securePassword.value = !securePassword;
                                      },
                                      child:FaIcon(securePassword? FontAwesomeIcons.solidEye:FontAwesomeIcons.solidEyeSlash,size: 15,color: Colors.grey,),
                                    ),
                                    hintText: "Password",
                                    hintStyle: GoogleFonts.nunito(color: Colors.grey),
                                  ),
                                );
                              },),
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
                                      authBloc.login(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color(0xFF222B65)),
                                      child: ValueListenableBuilder(
                                        valueListenable: authBloc.loginLoading,
                                        builder: (context, loginLoading, child) {
                                        if(loginLoading){
                                          return SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                                          );
                                        }
                                        return  Text(
                                          "Log In",
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        );
                                      },),
                                    ),
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
