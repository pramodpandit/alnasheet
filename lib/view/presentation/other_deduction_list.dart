import 'package:alnasheet/bloc/sallek_bloc.dart';
import 'package:alnasheet/data/repository/sallek_repo.dart';
import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:provider/provider.dart';

class OtherDeductionList extends StatefulWidget {
  const OtherDeductionList({super.key});

  @override
  State<OtherDeductionList> createState() => _OtherDeductionListState();
}

class _OtherDeductionListState extends State<OtherDeductionList> {
  late SallekBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = SallekBloc(context.read<SallekRepo>());
    bloc.getSallekList();
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
                      valueListenable: bloc.sallekList,
                      builder: (context, sallekList, child) {
                        if(sallekList == null){
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
                                  "Sallek",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                )),
                            // DataColumn(
                            //     label: Text(
                            //       "",
                            //       style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                            //     )),
                            // DataColumn(
                            //     label: Text(
                            //       "",
                            //       style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                            //     )),
                          ],
                          rows:
                            sallekList.map((e) => DataRow(cells: [
                              DataCell(Text(
                                e['on_date'].toString(),
                                style: GoogleFonts.lato(),
                              )),
                              DataCell(Text(
                                e['sallack_amount'].toString(),
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