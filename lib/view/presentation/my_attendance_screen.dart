import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:alnasheet/view/presentation/mark_attendance_screen.dart';

import '../../bloc/my_attends_bloc.dart';
import '../../data/repository/my_attends_repo.dart';

class MyAttendanceScreen extends StatefulWidget {
  const MyAttendanceScreen({super.key});

  @override
  State<MyAttendanceScreen> createState() => _MyAttendanceScreenState();
}

class _MyAttendanceScreenState extends State<MyAttendanceScreen> {
  late MyAttendsBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = MyAttendsBloc(context.read<MyAttendsRepo>());
    bloc.fetchAttendance(context);
  }
  @override
  Widget build(BuildContext context) {
    // final myAttendanceScreenProvider=Provider.of<MyAttendanceScreenProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:[ SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Header(title: "My Attendance"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFededed),
                        borderRadius: BorderRadius.circular(1000)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Search",
                        hintStyle: GoogleFonts.nunito(),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  "Select Month",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: bloc.month,
                                builder: (context, DateTime? monthDate, _) {
                                  return InkWell(
                                    onTap: () async {
                                      int? selectedMonth = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Select Month"),
                                            content: DropdownButton<int>(
                                              value: monthDate?.month ??
                                                  DateTime.now().month,
                                              items:
                                              List.generate(12, (index) {
                                                return DropdownMenuItem<int>(
                                                  value: index + 1,
                                                  child: Text(
                                                    DateFormat('MMMM').format(
                                                        DateTime(
                                                            DateTime.now()
                                                                .year,
                                                            index + 1,
                                                            1)),
                                                  ),
                                                );
                                              }),
                                              onChanged: (int? value) {
                                                Navigator.pop(context, value);
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context,
                                                      monthDate?.month ??
                                                          DateTime.now()
                                                              .month);
                                                },
                                                child: Text('Select'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (selectedMonth != null) {
                                        DateTime selectedDate = DateTime(bloc.year.value?.year ?? DateTime.now().year, selectedMonth,);
                                        await bloc.updateMonth(selectedDate);
                                        await bloc.fetchAttendance(context);
                                        print("$selectedDate");
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(PhosphorIcons.calendar),
                                          const SizedBox(width: 15),
                                          Text(
                                            monthDate == null
                                                ? DateFormat('MMMM').format(
                                                DateTime(DateTime.now().year, DateTime.now().month, 1))
                                                : DateFormat('MMMM').format(DateTime(DateTime.now().year, monthDate.month, 1)),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  "Select Year",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ValueListenableBuilder(
                                  valueListenable: bloc.year,
                                  builder: (context, DateTime? date, _) {
                                    return InkWell(
                                      onTap: () async {
                                        int? selectedYear = await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                              const Text("Select Year"),
                                              content: DropdownButton<int>(
                                                value: date?.year ??
                                                    DateTime.now().year,
                                                items: List.generate(30,
                                                        (index) {
                                                      return DropdownMenuItem<int>(value: DateTime.now().year -15 +
                                                          index,
                                                        child: Text((DateTime.now().year - 15 + index).toString()),
                                                      );
                                                    }),
                                                onChanged: (int? value) {
                                                  Navigator.pop(context, value);
                                                },
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, date?.year ?? DateTime.now().year);
                                                  },
                                                  child: Text('Select'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (selectedYear != null) {
                                          DateTime selectedDate =
                                          DateTime(selectedYear);
                                          await bloc.updateYear(selectedDate);
                                          await bloc.fetchAttendance(context);
                                        }
                                      },

                                      child: Container(
                                        height: 50,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(PhosphorIcons.clock),
                                            const SizedBox(width: 15),
                                            Text(
                                              date == null
                                                  ? DateFormat('yyyy')
                                                  .format(DateTime.now())
                                                  : DateFormat('yyyy')
                                                  .format(date),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     InkWell(
                      //       onTap: () async{
                      //         // await showDatePicker(
                      //         //   context: context,
                      //         //   initialDate: DateTime.now(),
                      //         //   firstDate: DateTime(1900),
                      //         //   lastDate: DateTime(3000),
                      //         // ).then((value){
                      //         //   myAttendanceScreenProvider.setDate(value.toString().split(" ")[0]);
                      //         // });
                      //       },
                      //       child: Container(
                      //         padding: const EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(5),
                      //             border: Border.all(color: Colors.grey, width: 1)),
                      //         child: Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             const Icon(Icons.calendar_month),
                      //             const SizedBox(width: 10),
                      //         Text("3/43/343",style: GoogleFonts.lato(),),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Text("To",style: GoogleFonts.nunito(fontSize: 17),),
                      //     InkWell(
                      //       onTap: () async{
                      //         // await showDatePicker(
                      //         //   context: context,
                      //         //   initialDate: DateTime.now(),
                      //         //   firstDate: DateTime(1900),
                      //         //   lastDate: DateTime(3000),
                      //         // ).then((value){
                      //         //   myAttendanceScreenProvider.setDate(value.toString().split(" ")[0]);
                      //         // });
                      //       },
                      //       child: Container(
                      //         padding: const EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(5),
                      //             border: Border.all(color: Colors.grey, width: 1)),
                      //         child: Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             const Icon(Icons.calendar_month),
                      //             const SizedBox(width: 10),
                      //         Text("43/43/4544",style: GoogleFonts.lato(),),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                            child: AttendanceStatus(
                              onTap: () {
                                Navigator.push(context, PageTransition(child: const MarkAttendanceScreen(), type: PageTransitionType.rightToLeft));
                              },
                                color: Colors.green, title: "Present", count: 24),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: AttendanceStatus(
                              onTap: () {

                              },
                                color: const Color(0xFf8a030a),
                                title: "Absent",
                                count: 01),
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                            child: AttendanceStatus(
                                onTap: () {

                                },
                                color: const Color(0xFFe3de84),
                                title: "Half Duty",
                                count: 01),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: AttendanceStatus(
                                onTap: () {
                                  Navigator.push(context, PageTransition(child: const MarkAttendanceScreen(), type: PageTransitionType.rightToLeft));
                                },
                                color: Colors.green, title: "Full Duty", count: 24),
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                            child: AttendanceStatus(
                                onTap: () {

                                },
                                color: const Color(0xFf8a030a),
                                title: "Double Duty",
                                count: 01),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: AttendanceStatus(
                                onTap: () {

                                },
                                color: const Color(0xFFe3de84),
                                title: "Amazon Support",
                                count: 01),
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                            child: AttendanceStatus(
                                onTap: () {
                                  Navigator.push(context, PageTransition(child: const MarkAttendanceScreen(), type: PageTransitionType.rightToLeft));
                                },
                                color: Colors.green, title: "Internal Support", count: 24),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(child: Container()),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      ValueListenableBuilder(
                        valueListenable: bloc.isLoadingAtteds,
                        builder: (context, isLoading, child) {
                          if(isLoading){
                            return Center(child: CircularProgressIndicator());
                          }
                          return ValueListenableBuilder(
                            valueListenable: bloc.AttendsList,
                            builder: (context, attendsList, child) {

                              if(attendsList ==null){
                                return Center(child: CircularProgressIndicator());
                              }else if(attendsList ==''){
                                return Text('Data does not exist!');
                              }
                              else{
                                List attensListData = (attendsList['attendance_details']as List).reversed.toList();
                                return  ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                    itemCount: attensListData.length,
                                    itemBuilder: (context,index){
                                      var data = attensListData[index];
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                                    child:  LastAttendance(
                                      day: DateFormat('EEEE').format(DateTime.parse(data['on_date'])),
                                      date: DateFormat("dd-MM-yyyy").format(DateTime.parse(data['on_date'])),
                                      status: data['is_agree'].toString() == '1'?"Present":'Absent',
                                      statusType: "Amazon Support",
                                      amount: data['total_full_payment'],
                                    ),
                                  );
                                });
                              }
                            },

                          );

                        },

                      )
                    ],
                  )
                ],
              ),
            ),
            const GoBack(),
        ]
          ),
        ),
      ),
    );
  }
}

class AttendanceStatus extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String title;
  final int count;
  const AttendanceStatus(
      {super.key,
        required this.onTap,
      required this.color,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: const Color(0xFFe6e5e3), borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: double.infinity,
                  width: 3,
                  decoration: BoxDecoration(color: color),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(title,style: GoogleFonts.lato(),),
              ],
            ),
            Row(
              children: [
                Text("$count",style: GoogleFonts.lato(),),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LastAttendance extends StatelessWidget {
  final String day;
  final String date;
  final String status;
  final String statusType;
  final int amount;
  const LastAttendance(
      {super.key,
      required this.day,
      required this.date,
        required this.status,
        required this.statusType,
        required this.amount,
      });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
        day
            ,
            style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold,
            color: const Color(0xFF222B65),
            ),
          ),
          Text(date,
              style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold,
                color: const Color(0xFF222B65),
              )),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 2,
        color: const Color(0xFF222B65),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(status,
            style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: status=="Present"?Colors.green:Colors.red.shade900,
            ),
          ),
          Text(status=="Present"?"Rs. $amount":"",
            style: GoogleFonts.lato(fontWeight: FontWeight.bold,
                color: status=="Present"?Colors.green:Colors.red,
            ),
          )
        ],
      ),
      statusType!=""?const SizedBox(height: 5,):Container(),
      statusType!=""?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(statusType,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          Text(statusType!=""?"Rs. $amount":"",
            style: GoogleFonts.lato(fontWeight: FontWeight.bold,
              color: Colors.pink
            ),
          )
        ],
      ):Container(),
      const SizedBox(height: 10,),
    ]);
  }
}
