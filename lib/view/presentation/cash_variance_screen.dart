import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
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
    bloc.fetchCashVariance(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:[
              SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Header(title: "Cash Variance"),
                  SizedBox(
                    height: 30,
                  ),
                  ValueListenableBuilder(
                    valueListenable: bloc.isLoadingCashVariance,
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
                      return ValueListenableBuilder(
                        valueListenable: bloc.cashVariance,
                        builder:(context, cashVariance, child) {
                          if(cashVariance ==null){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 100),
                                CircularProgressIndicator(),
                              ],
                            );
                          }else if(cashVariance.isEmpty){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 100),
                                Text('Cash variance data not found '),
                              ],
                            );
                          }
                          return DataTable(
                            columnSpacing: 30.0,
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
                                    "Name",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    "Vehicle No",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  )),
                            ],
                            rows: List.generate(
                                cashVariance.length, (index) {
                              return DataRow(
                                  cells: [
                                    DataCell(Text("${DateFormat("yyyy-MM-dd").format(DateTime.parse(cashVariance[index]['on_date'].toString()))}",style: GoogleFonts.lato(fontSize : 12))),
                                    DataCell(Text("${double.parse(cashVariance[index]['amount'].toString()).toStringAsFixed(0)}",style: GoogleFonts.lato(fontSize : 12)),),
                                    DataCell(Text("${cashVariance[index]['poc_name']}",style: GoogleFonts.lato(fontSize : 12))),
                                    DataCell(Text("${cashVariance[index]['vehicle_no']}",style: GoogleFonts.lato(fontSize : 12)))
                                  ]);
                            }),
                          );



                        },

                      );
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
