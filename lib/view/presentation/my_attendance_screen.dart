import 'package:alnasheet/view/components/go_back.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:alnasheet/view/components/header.dart';
import 'package:alnasheet/view/presentation/mark_attendance_screen.dart';

class MyAttendanceScreen extends StatelessWidget {
  const MyAttendanceScreen({super.key});

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
                        children: [
                          InkWell(
                            onTap: () async{
                              // await showDatePicker(
                              //   context: context,
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime(1900),
                              //   lastDate: DateTime(3000),
                              // ).then((value){
                              //   myAttendanceScreenProvider.setDate(value.toString().split(" ")[0]);
                              // });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey, width: 1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 10),
                              Text("43/65/3445",style: GoogleFonts.lato(),)
                                ],
                              ),
                            ),
                          ),
                          Text("To",style: GoogleFonts.nunito(fontSize: 17),),
                          InkWell(
                            onTap: () async{
                              // await showDatePicker(
                              //   context: context,
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime(1900),
                              //   lastDate: DateTime(3000),
                              // ).then((value){
                              //   myAttendanceScreenProvider.setDate(value.toString().split(" ")[0]);
                              // });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey, width: 1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 10),
                              Text("75/56/3674",style: GoogleFonts.lato(),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            LastAttendance(
                              day: "Friday",
                              date: "12 April 2023",
                              status: "Present",
                              statusType: "Amazon Support",
                              amount: 1000,
                            ),
                            LastAttendance(
                              day: "Thursday",
                              date: "11 April 2023",
                              status: "Present",
                              statusType: "Internal Support",
                              amount: 1000,
                            ),
                            LastAttendance(
                              day: "Wednesday",
                              date: "10 April 2023",
                              status: "Absent",
                              statusType: "",
                              amount: 1000,
                            ),
                            LastAttendance(
                              day: "Tuesday",
                              date: "9 April 2023",
                              status: "Present",
                              statusType: "",
                              amount: 1000,
                            ),
                            LastAttendance(
                              day: "Monday",
                              date: "8 April 2023",
                              status: "Absent",
                              statusType: "",
                              amount: 1000,
                            ),
                          ],
                        ),
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
            day,
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
