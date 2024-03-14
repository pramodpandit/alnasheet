import 'package:alnasheet/bloc/traffic_fine_bloc.dart';
import 'package:alnasheet/data/repository/Traffic_fine_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
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
                          return Center(
                            child: SizedBox(
                                height: 300,
                                child: Center(child: CircularProgressIndicator())),
                          );
                        }
                      return DataTable(
                          columnSpacing: 10.0,
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
                                e['on_date'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Center(
                                child: Text(
                                  e['total_amount'].toString(),
                                  style: GoogleFonts.lato(),
                                ),
                              )),
                            DataCell(Center(
                              child: Text(
                                e['fine_amount'].toString(),
                                style: GoogleFonts.lato(),
                              ),
                            )),
                            DataCell(Center(
                              child: Text(
                                e['fine_number'].toString(),
                                style: GoogleFonts.lato(),
                              ),
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
