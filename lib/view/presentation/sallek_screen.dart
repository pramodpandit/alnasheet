import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:provider/provider.dart';

import '../../bloc/sallek_bloc.dart';
import '../../data/repository/sallek_repo.dart';

class SallekScreen extends StatefulWidget {
  const SallekScreen({super.key});

  @override
  State<SallekScreen> createState() => _SallekScreenState();
}

class _SallekScreenState extends State<SallekScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:[ SizedBox(
              width: MediaQuery.of(context).size.width,
              child:
              Column(
                children: [
                  Header(title: "Sallek"),
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
                                "Sallek",
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
