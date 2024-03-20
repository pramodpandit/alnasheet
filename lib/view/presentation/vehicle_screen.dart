import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:alnasheet/view/presentation/vehicle_data_screen.dart';

class VehicleInspectionScreen extends StatelessWidget {
  const VehicleInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:[ SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Header(title: "Vehicle Inspection"),
                  SizedBox(
                    height: 30,
                  ),
                  InspectionLinks(
                    date: "2023-04-25",
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: VehicleDataScreen(),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                  InspectionLinks(
                    date: "2023-04-25",
                    onTap: () {},
                  ),
                  InspectionLinks(
                    date: "2023-04-25",
                    onTap: () {},
                  ),
                  InspectionLinks(
                    date: "2023-04-25",
                    onTap: () {},
                  ),
                ],
              ),
            ),
              GoBack(),
        ]
          ),
        ),
      ),
    );
  }
}

class InspectionLinks extends StatelessWidget {
  final String date;
  final VoidCallback onTap;
  const InspectionLinks({super.key, required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date,style: GoogleFonts.lato(),),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                        color: Color(0xFF222B65),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Text(
                      "View Link",
                      style: GoogleFonts.nunito(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
