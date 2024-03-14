import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
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
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return ValueListenableBuilder(
                          valueListenable: bloc.MissingStatement,
                          builder: (context, missingShipment, child) {
                            if(missingShipment == null){
                              return Center(child: CircularProgressIndicator());
                            }else if(missingShipment.isEmpty
                            ){
                              return Text('Shipment data not found');
                            }
                            return Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: DataTable(
                                    columnSpacing: 10.0,
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
                                            "   Name",
                                            style: GoogleFonts.lato(fontWeight: FontWeight.bold),textAlign: TextAlign.center,
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
                                            DataCell(Center(child: Container(width: 75, child: Text("${DateFormat.yMd().format(DateTime.parse(missingShipment[index]['on_date'].toString()))}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),))),
                                            DataCell(Center(child: Container(  child: Text("${missingShipment[index]['amount']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),)),),
                                            DataCell(Center(child: Container(  child: Text("${missingShipment[index]['poc_name']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),))),
                                            DataCell(Center(child: Container( child: Text("${missingShipment[index]['vehicle_no']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),)))
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
