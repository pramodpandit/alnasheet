import 'package:alnasheet/bloc/excess_fuel_list_bloc.dart';
import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/excess_fuel_list_repo.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
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
    bloc.getExcessFuelList();
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
                          return Center(
                            child: SizedBox(
                                height: 300,
                                child: Center(child: CircularProgressIndicator())),
                          );
                        }
                      return DataTable(
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
                                e['on_date'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Text(
                                e['fuel_price'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Text(
                                e['fuel_qty'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Text(
                                e['vehicle_no'].toString(),
                                style: GoogleFonts.lato(),
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
