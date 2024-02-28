import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/auth/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
              child: SizedBox(
              width: MediaQuery.of(context).size.width,
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
                              "New Password",
                              style: GoogleFonts.lato(
                                  color: Color(0xFF1C2340),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text("New Password",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 7,),
                                  TextFormField(
                                    cursorColor: Colors.black,
                                    obscureText: true,
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
                                        onTap: () {},
                                        child: Icon(Icons.remove_red_eye),
                                      ),
                                      hintText: "Password",
                                      hintStyle: GoogleFonts.nunito(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Text("Confirm Password",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 7,),
                                  TextFormField(
                                    cursorColor: Colors.black,
                                    obscureText: true,
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
                                        onTap: () {},
                                        child: Icon(Icons.remove_red_eye),
                                      ),
                                      hintText: "Confirm Password",
                                      hintStyle: GoogleFonts.nunito(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(height: 25,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color(0xFF222B65)),
                                      child: Text(
                                        "Change Password",
                                        style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
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
            ),
          ]
        ),
      ),
    );
  }
}
