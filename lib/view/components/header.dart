import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFFFC6E7),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(70, 20),
              bottomRight: Radius.elliptical(70, 20)),
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Image.asset(
              "assets/images/Al.Nasheet-logo.png",
              width: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              title,
              style: GoogleFonts.lato(
                  color: Color(0xFF222B65),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
  }
}
