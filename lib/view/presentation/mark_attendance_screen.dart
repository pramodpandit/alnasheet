import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/components/header.dart';

import '../../bloc/my_attends_bloc.dart';
import '../../data/repository/my_attends_repo.dart';

class MarkAttendanceScreen extends StatefulWidget {
  const MarkAttendanceScreen({super.key});

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  late MyAttendsBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = MyAttendsBloc(context.read<MyAttendsRepo>());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:[
              SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Header(title: "My Attendance"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Text("564/35/53",style: GoogleFonts.lato(),),
                        ),
                        SizedBox(height: 50,),
                        InkWell(
                          onTap: () {
                            bloc.acceptAttend(context, '1');
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: [Color(0xFF222B65),Color(0xFF1C2340)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                            ),
                            child: Center(child: Text("Accept",style: GoogleFonts.lato(color: Colors.white,fontSize: 16),)),
                          ),
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context, builder: (context) {
                              return AttendanceModal(bloc: bloc,);
                            },);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(colors: [Color(0xFF222B65),Color(0xFF1C2340)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                            ),
                            child: Center(child: Text("Raise a Dispute",style: GoogleFonts.lato(color: Colors.white,fontSize: 16),)),
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  )
                ],
              ),
            ),
              GoBack()
        ]
          ),
        ),
      ),
    );
  }
}

class AttendanceModal extends StatelessWidget {
  final MyAttendsBloc bloc;
  const AttendanceModal({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFD8D8D8),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: bloc.disputeText,
                          cursorColor: Colors.grey,
                          maxLines: 7,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1)
                          ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(5)
                              ),
                          hintText: "Write Something",
                            hintStyle: GoogleFonts.lato(fontSize: 15)
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          bloc.acceptdispute(context, );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: [Color(0xFF1C2340),Color(0xFF222B65)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                          ),
                          child: Center(child: Text("Submit",style: GoogleFonts.lato(color: Colors.white,fontSize: 16),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
//
// decoration: BoxDecoration(
// color: Color(0xFFD8D8D8),
// borderRadius: BorderRadius.circular(5)
// ),