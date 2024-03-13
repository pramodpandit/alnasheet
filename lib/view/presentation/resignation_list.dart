import 'package:alnasheet/bloc/resignation_list_bloc.dart';
import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/resignation_list_repo.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:provider/provider.dart';

class ResignationList extends StatefulWidget {
  const ResignationList({super.key});

  @override
  State<ResignationList> createState() => _ResignationListState();
}

class _ResignationListState extends State<ResignationList> {
  late ResignationListBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ResignationListBloc(context.read<ResignationListRepo>());
    bloc.getResignationList();
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
                  Header(title: "Resignation List"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                      valueListenable: bloc.resignationList,
                      builder: (context, resignationList, child) {
                        if(resignationList == null){
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
                                  "Reason",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            DataColumn(
                                label: Text(
                                  "Clearance",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            // DataColumn(
                            //     label: Text(
                            //       "",
                            //       style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                            //     )),
                          ],
                          rows:
                          resignationList.map((e) => DataRow(cells: [
                              DataCell(Text(
                                e['resignation_date'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Text(
                                e['resignation_reason'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                            DataCell(Text(
                              e['clearance_date'].toString(),
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
