import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFFFC6E7),
            title: Text("My Account",style: GoogleFonts.nunito(fontSize: 17,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
