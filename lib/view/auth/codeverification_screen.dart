import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:alnasheet/view/auth/reset_password_screen.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({super.key});

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
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Code Verification",
                        style: GoogleFonts.lato(
                            color: Color(0xFF222B65),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Verification Code has been sent to",style: GoogleFonts.lato(color: Color(0xFF7C7A7A)),),
                      Text(
                        "+91 7865556757",
                        style: GoogleFonts.lato(color: Color(0xFF222B65),fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Pinput(
                        obscureText: true,
                        obscuringCharacter: "*",
                        defaultPinTheme: PinTheme(
                          height: 40,
                          width: 40,
                          textStyle: GoogleFonts.nunito(
                              fontSize: 20,
                              color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(234, 239, 243, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          height: 40,
                          width: 40,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I didn't recieve code.",style: GoogleFonts.lato(fontSize: 12,color: Color(0xFF8D8D8D)),),
                          InkWell(
                            onTap: () {},
                            child: Text("Resend Code",style: GoogleFonts.lato(fontSize: 12,color: Color(0xFF000000),fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, PageTransition(child: ResetPasswordScreen(), type: PageTransitionType.rightToLeft));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF222B65)),
                          child: Text(
                            "Verify Code",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
