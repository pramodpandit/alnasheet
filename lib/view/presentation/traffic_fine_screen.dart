import 'package:alnasheet/bloc/traffic_fine_bloc.dart';
import 'package:alnasheet/data/repository/Traffic_fine_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrafficFineScreen extends StatefulWidget {
  const TrafficFineScreen({super.key});

  @override
  State<TrafficFineScreen> createState() => _TrafficFineScreenState();
}

class _TrafficFineScreenState extends State<TrafficFineScreen> {
  late TrafficFinebloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = TrafficFinebloc(context.read<TrafficFineRepo>());
    bloc.getTrafficFineList(context);
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
                  Header(title: "Traffic Fine"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: bloc.trafficFineList,
                      builder: (context, trafficFineList, child) {
                        if(trafficFineList == null){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 100),
                              CircularProgressIndicator(),
                            ],
                          );
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
                                  "Fine",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Fine Amount",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Fine Number",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                          ],
                          rows: trafficFineList.map((e) => DataRow(cells: [
                              DataCell(Text(
                                DateFormat("yyyy-MM-dd").format(DateTime.parse(e['on_date'].toString())),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                              DataCell(Text(
                                double.parse(e['total_amount'].toString()).toStringAsFixed(0),
                                style: GoogleFonts.lato(fontSize : 12),
                              )),
                            DataCell(Text(
                              double.parse(e['fine_amount'].toString()).toStringAsFixed(0),
                              style: GoogleFonts.lato(fontSize : 12),
                            )),
                            DataCell(Text(
                              e['fine_number'].toString(),
                              style: GoogleFonts.lato(fontSize : 12),
                            )),
                            ]),).toList()
                          );
                    },),
                  )
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
