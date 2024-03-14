import 'package:alnasheet/view/auth/changepass_screen.dart';
import 'package:alnasheet/view/auth/login_screen.dart';
import 'package:alnasheet/view/presentation/excess_fuel_list.dart';
import 'package:alnasheet/view/presentation/other_deduction_list.dart';
import 'package:alnasheet/view/presentation/resignation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/presentation/cash_variance_screen.dart';
import 'package:alnasheet/view/presentation/missing_shipment_screen.dart';
import 'package:alnasheet/view/presentation/my_attendance_screen.dart';
import 'package:alnasheet/view/presentation/sallek_screen.dart';
import 'package:alnasheet/view/presentation/traffic_fine_screen.dart';
import 'package:alnasheet/view/presentation/vehicle_screen.dart';
import 'package:provider/provider.dart';

import '../../bloc/user_information_bloc.dart';
import '../../data/repository/user_information_repo.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late UserInformationBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc= UserInformationBloc(context.read<UserInformationRepo>());
    bloc.UserInformation(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: bloc.isLoadingUserInformation,
          builder: (context, bool isLoading, child) {
            if(isLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            return ValueListenableBuilder(valueListenable: bloc.informationData,
                builder: (context, userinformation, child) {
              return Stack(
                  alignment: Alignment.topRight,
                  children:[
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFC6E7),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(70, 20),
                                    bottomRight: Radius.elliptical(70, 20)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Image.asset(
                                    "assets/images/Al.Nasheet-logo.png",
                                    width: 150,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            child: Image.network(
                                              "https://cdn-icons-png.flaticon.com/512/299/299310.png",
                                              width: 50,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Welcome, ${userinformation['das_first_name'] ??''} ${userinformation['das_last_name']??''}",
                                            style: GoogleFonts.lato(color: Color(0xFF222B65),fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      // Container(
                                      //   height: 40,
                                      //   width: 40,
                                      //   decoration: BoxDecoration(
                                      //       color: Colors.white,
                                      //       borderRadius: BorderRadius.circular(1000)),
                                      //   child: Icon(Icons.notifications),
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: MyAttendanceScreen(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_1.png",
                                        title: "My Attendance",
                                        count: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: VehicleInspectionScreen(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_2.png",
                                        title: "Vehicle Inspection",
                                        count: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: CashVarianceScreen(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_3.png",
                                        title: "Cash Variance",
                                        count: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: TrafficFineScreen(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_4.png",
                                        title: "Traffic Fine",
                                        count: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                child: MissingShipmentScreen(),
                                                type: PageTransitionType.rightToLeft,
                                              ));
                                        },
                                        image:
                                        "assets/images/dash_img_5.png",
                                        title: "Missing Shipment",
                                        count: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: SallekScreen(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_6.png",
                                        title: "Sallek",
                                        count: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                child: ExcessFuelList(),
                                                type: PageTransitionType.rightToLeft,
                                              ));
                                        },
                                        image:
                                        "assets/images/dash_img_2.png",
                                        title: "Excess Fuel List",
                                        count: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: OtherDeductionList(),
                                                  type: PageTransitionType.rightToLeft));
                                        },
                                        image:
                                        "assets/images/dash_img_3.png",
                                        title: "Deduction List",
                                        count: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                child: ResignationList(),
                                                type: PageTransitionType.rightToLeft,
                                              ));
                                        },
                                        image:
                                        "assets/images/dash_img_1.png",
                                        title: "Resignation List",
                                        count: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Options(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                child: ChangePassScreen(),
                                                type: PageTransitionType.rightToLeft,
                                              ));
                                        },
                                        image:
                                        "assets/images/dash_img_1.png",
                                        title: "Change Password",
                                        count: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap : () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            LoginScreen().launch(context,isNewTask: true);
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: Icon(Icons.logout,color: Colors.black,size: 20,)),
                      ),
                    ),
                  ]
              );

                },);
          },
        )
    )

        );
  }
}

class Options extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final int count;
  const Options(
      {super.key,
      required this.onTap,
      required this.image,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 150,
          height: 130,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image,
                  width: 40,
                ),
                Text(
                  title,
                  style: GoogleFonts.lato(),
                ),
                // Text(
                //   count.toString(),
                //   style: GoogleFonts.lato(
                //       color: Color(0xFf8a030a),
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold),
                // ),
              ]),
        ),
      ),
    );
  }
}
