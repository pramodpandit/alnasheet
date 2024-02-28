import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';

class CashVarianceScreen extends StatelessWidget {
  const CashVarianceScreen({super.key});

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
                  Header(title: "Cash Variance"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                            "Date",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Cash",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                          )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              "25-04-2023",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "500",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "25-04-2023",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "500",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              "25-04-2023",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "500",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
                            )),
                            DataCell(Text(
                              "",
                              style: GoogleFonts.lato(),
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
