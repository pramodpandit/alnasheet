import 'package:alnasheet/bloc/excess_fuel_list_bloc.dart';
import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExcessFuelList extends StatefulWidget {
  const ExcessFuelList({super.key});

  @override
  State<ExcessFuelList> createState() => _ExcessFuelListState();
}

class _ExcessFuelListState extends State<ExcessFuelList> {
  late ExcessFuelListBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ExcessFuelListBloc(context.read<ExcessFuelListRepo>());
    bloc.getExcessFuelList(context);
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
                  Header(title: "Excess Fuel List"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: bloc.excessFuelList,
                      builder: (context, excessFuelList, child) {
                        if(excessFuelList == null){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 100),
                              CircularProgressIndicator(),
                            ],
                          );;
                        }
                      return DataTable(
                        columnSpacing: 20.0,
                          columns: [
                            DataColumn(
                                label: Text(
                                  "Date",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Fuel Price",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Qty.",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Vehicle no.",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                          ],
                          rows:
                          excessFuelList.map((e) => DataRow(cells: [
                              DataCell(Text(
                                DateFormat("yyyy-MM-dd").format(DateTime.parse(e['on_date'].toString())),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                              DataCell(Text(
                                double.parse(e['fuel_price'].toString()).toStringAsFixed(0),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                              DataCell(Text(
                                e['fuel_qty'].toString(),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                              DataCell(Text(
                                e['vehicle_no'].toString(),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                            ])).toList(),
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
