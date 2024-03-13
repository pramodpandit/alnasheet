import 'package:alnasheet/bloc/authBloc.dart';
import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/auth/codeverification_screen.dart';
import 'package:provider/provider.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  late AuthBloc authBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc =AuthBloc(context.read<AuthRepository>());
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forgot Password",
                      style: GoogleFonts.lato(
                          color: Color(0xFF222B65),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: ValueListenableBuilder(
                    //     valueListenable: authBloc.newPassword,
                    //     builder: (context, newPassword, child) {
                    //     return Text(newPassword,
                    //       style: GoogleFonts.lato(
                    //           fontSize: 15,
                    //           color: Color(0xFF7C7A7A)),
                    //       textAlign: TextAlign.center,
                    //     );
                    //   },)
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: authBloc.forgotPasswordUsername,
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
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              authBloc.forgotPassword(context);
                              // Navigator.push(context, PageTransition(child: CodeVerificationScreen(), type: PageTransitionType.rightToLeft));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF222B65)),
                              child: ValueListenableBuilder(
                                valueListenable: authBloc.forgotPasswordLoading,
                                builder: (context, forgotPasswordLoading, child) {
                                  if(forgotPasswordLoading){
                                    return SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                                    );
                                  }
                                  return  Text(
                                    "Change Password",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  );
                                },),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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