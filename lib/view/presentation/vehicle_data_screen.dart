import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';

class VehicleDataScreen extends StatelessWidget {
  const VehicleDataScreen({super.key});

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
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                                "V. Number",
                                style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 12),
                              )),
                          DataColumn(
                              label: Text(
                                "V. Model",
                                style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 12),
                              )),
                          DataColumn(
                              label: Text(
                                "Time",
                                style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 12),
                              )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              "Dl 10 CJ 4726",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "Tuv",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "10:00 Am",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "Dl 10 CJ 4726",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "Tuv",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "10:00 Am",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                          ]),DataRow(cells: [
                            DataCell(Text(
                              "Dl 10 CJ 4726",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "Tuv",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                            DataCell(Text(
                              "10:00 Am",
                              style: GoogleFonts.lato(fontSize: 12),
                            )),
                          ]),
                        ]),
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
