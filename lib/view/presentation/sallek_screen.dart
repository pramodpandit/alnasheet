import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SallekScreen extends StatefulWidget {
  const SallekScreen({super.key});

  @override
  State<SallekScreen> createState() => _SallekScreenState();
}

class _SallekScreenState extends State<SallekScreen> {
  late SallekBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = SallekBloc(context.read<SallekRepo>());
    bloc.getSallekList(context);
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
                  Header(title: "Sallek"),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: bloc.isLoadingSallek,
                      builder: (context, loading, child) {
                        if(loading){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 100),
                              CircularProgressIndicator(),
                            ],
                          );
                        }
                        return  ValueListenableBuilder(
                          valueListenable: bloc.sallekList,
                          builder: (context, sallekList, child) {
                            if(sallekList == null){
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
                                      "Sallek",
                                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                    )),
                                DataColumn(
                                    label: Text(
                                      "Vehicle No",
                                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                    )),
                              ],
                              rows:
                              sallekList.map((e) => DataRow(cells: [
                                DataCell(Text(
                                  DateFormat("yyyy-MM-dd").format(DateTime.parse(e['on_date'].toString())),
                                  style: GoogleFonts.lato(fontSize : 12),
                                )),
                                DataCell(Text(
                                  double.parse(e['sallack_amount'].toString()).toStringAsFixed(0),
                                  style: GoogleFonts.lato(fontSize : 12),
                                )),
                                DataCell(Text(
                                  e['vehicle_no'].toString(),
                                  style: GoogleFonts.lato(fontSize : 12),
                                )),
                              ])).toList(),
                            );
                          },);
                      },

                    ),
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
