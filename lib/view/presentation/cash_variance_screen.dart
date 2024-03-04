import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:provider/provider.dart';

import '../../bloc/cash_varuance_bloc.dart';
import '../../data/repository/cash_variance_repo.dart';

class CashVarianceScreen extends StatefulWidget {
  const CashVarianceScreen({super.key});

  @override
  State<CashVarianceScreen> createState() => _CashVarianceScreenState();
}

class _CashVarianceScreenState extends State<CashVarianceScreen> {
  late CashVarianceBloc bloc;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = CashVarianceBloc(context.read<CashVariance>());
    bloc.fetchCashVariance();
  }
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
