import 'package:alnasheet/bloc/deduction_bloc.dart';
import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:provider/provider.dart';

import '../../data/repository/Deduction_repo.dart';

class OtherDeductionList extends StatefulWidget {
  const OtherDeductionList({super.key});

  @override
  State<OtherDeductionList> createState() => _OtherDeductionListState();
}

class _OtherDeductionListState extends State<OtherDeductionList> {
  late DeductionBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = DeductionBloc(context.read<DeductionRepo>());
    bloc.fetchdeductionVariance(context);
  }
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
                  Header(title: "Deduction"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: bloc.deduction,
                      builder: (context, sallekList, child) {
                        if(sallekList == null){
                          return Center(
                            child: SizedBox(
                                height: 300,
                                child: Center(child: CircularProgressIndicator())),
                          );
                        }
                      return Center(
                        child: DataTable(
                          columnSpacing: 20.0,
                            columns: [
                              DataColumn(
                                  label: Text(
                                    "Date",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    "Deduction",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    "Vehicle No",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  )),
                              // DataColumn(
                              //     label: Text(
                              //       "Remark",
                              //       style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                              //     )),
                            ],
                            rows:
                              sallekList.map((e) => DataRow(cells: [
                                DataCell(Text(
                                  e['on_date'].toString(),
                                  style: GoogleFonts.lato(),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    e['amount'].toString(),
                                    style: GoogleFonts.lato(),
                                  ),
                                )),
                                DataCell(Text(
                                  e['vehicle_no'].toString(),
                                  style: GoogleFonts.lato(),
                                )),
                                // DataCell(Text(
                                //   e['remark'].toString(),
                                //   style: GoogleFonts.lato(),
                                // )),
                              ])).toList(),
                            ),
                      );
                    },),
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
