import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:intl/intl.dart';
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
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return ValueListenableBuilder(
                        valueListenable: bloc.cashVariance,
                        builder:(context, cashVariance, child) {
                          if(cashVariance ==null){
                            return Center(child: CircularProgressIndicator(),);
                          }else if(cashVariance.isEmpty){
                            return Center(child: Text('Cash variance data not found '),);
                          }
                          return      Center(
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
                                          "Vehicle_no",
                                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                  rows: List.generate(
                                      cashVariance.length, (index) {
                                    return DataRow(
                                        cells: [
                                          DataCell(Center(child: Container(width: 75, child: Text("${DateFormat.yMd().format(DateTime.parse(cashVariance[index]['on_date'].toString()))}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),))),
                                          DataCell(Center(child: Container(  child: Text("${cashVariance[index]['amount']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),)),),
                                          DataCell(Center(child: Container(  child: Text("${cashVariance[index]['poc_name']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),))),
                                          DataCell(Center(child: Container( child: Text("${cashVariance[index]['vehicle_no']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 11),),)))
                                        ]);
                                  }),
                                ),
                              ),
                            ),
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
