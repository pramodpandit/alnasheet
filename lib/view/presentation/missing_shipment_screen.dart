import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../bloc/missing_shipment_bloc.dart';
import '../../data/repository/missing_shipment_repo.dart';

class MissingShipmentScreen extends StatefulWidget {
  const MissingShipmentScreen({super.key});

  @override
  State<MissingShipmentScreen> createState() => _MissingShipmentScreenState();
}

class _MissingShipmentScreenState extends State<MissingShipmentScreen> {
  late MissingShipmentbloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = MissingShipmentbloc(context.read<MissingShipmentRepo>());
    bloc.fetchMissingShipment(context);
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
                  Header(title: "Missing Shipment"),
                  SizedBox(
                    height: 30,
                  ),
                  ValueListenableBuilder(
                    valueListenable: bloc.isLoadingMissingStatement,
                    builder: (context, loading, child) {
                      if(loading){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            CircularProgressIndicator(),
                          ],
                        );;
                      }
                      return ValueListenableBuilder(
                          valueListenable: bloc.MissingStatement,
                          builder: (context, missingShipment, child) {
                            if(missingShipment == null){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100),
                                  CircularProgressIndicator(),
                                ],
                              );
                            }else if(missingShipment.isEmpty
                            ){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100),
                                  Text("Shipment data not found"),
                                ],
                              );
                            }
                            return Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
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
                                            "Shipment",
                                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            "Name",
                                            style: GoogleFonts.lato(fontWeight: FontWeight.bold)
                                          )),
                                      DataColumn(
                                          label: Text(
                                            "Vehicle No",
                                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                    rows: List.generate(
                                        missingShipment.length, (index) {
                                      return DataRow(
                                          cells: [
                                            DataCell(Text("${DateFormat("yyyy-MM-dd").format(DateTime.parse(missingShipment[index]['on_date'].toString()))}",style: GoogleFonts.lato(fontSize : 12))),
                                            DataCell(Text("${double.parse(missingShipment[index]['amount'].toString()).toStringAsFixed(0)}",style: GoogleFonts.lato(fontSize : 12)),),
                                            DataCell(Text("${missingShipment[index]['poc_name']}",style: GoogleFonts.lato(fontSize : 12))),
                                            DataCell(Text("${missingShipment[index]['vehicle_no']}",style: GoogleFonts.lato(fontSize : 12)))
                                          ]);
                                    }),
                                  ),
                                ),
                              ),
                            );

                          },);
                    },

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
