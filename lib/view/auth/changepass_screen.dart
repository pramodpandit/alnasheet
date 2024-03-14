import 'package:alnasheet/bloc/authBloc.dart';
import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/auth/forgotpass_screen.dart';
import 'package:provider/provider.dart';

import '../../Utils/message_handler.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  late AuthBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = AuthBloc(context.read<AuthRepository>());
    bloc.msgController?.stream.listen((event) {
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
                      "Change Password",
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
                          SizedBox(height: 20,),
                          Text("New Password",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 7,),
                          ValueListenableBuilder(
                            valueListenable: bloc.showChangePass,
                            builder: (context, showChangePass, child) {
                            return TextFormField(
                              controller: bloc.changePass,
                              cursorColor: Colors.black,
                              obscureText: showChangePass,
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
                                    bloc.showChangePass.value = !showChangePass;
                                  },
                                  child:FaIcon(showChangePass? FontAwesomeIcons.solidEye:FontAwesomeIcons.solidEyeSlash,size: 15,color: Colors.grey,),
                                ),
                                hintText: "Password",
                                hintStyle: GoogleFonts.nunito(color: Colors.grey),
                              ),
                            );
                          },),
                          SizedBox(height: 15,),
                          Text("Confirm Password",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 7,),
                          ValueListenableBuilder(
                            valueListenable: bloc.showConfirmChangePass,
                            builder: (context, showConfirmChangePass, child) {
                            return TextFormField(
                              controller: bloc.confirmChangePass,
                              cursorColor: Colors.black,
                              obscureText: showConfirmChangePass,
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
                                    bloc.showConfirmChangePass.value = !showConfirmChangePass;
                                  },
                                  child:FaIcon(showConfirmChangePass? FontAwesomeIcons.solidEye:FontAwesomeIcons.solidEyeSlash,size: 15,color: Colors.grey,),
                                ),
                                hintText: "Confirm Password",
                                hintStyle: GoogleFonts.nunito(color: Colors.grey),
                              ),
                            );
                          },),
                          SizedBox(height: 25,),
                          InkWell(
                            onTap: () {
                              bloc.changePassword(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF222B65)),
                              child: ValueListenableBuilder(
                                valueListenable: bloc.changePassLoading,
                                builder: (context, changePassLoading, child) {
                                  if(changePassLoading){
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
