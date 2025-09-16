import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Placeorder extends StatefulWidget {
  const Placeorder({super.key});

  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Shopping Bag",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/images/clips2.jpg",
                      height: 100, width: 80, fit: BoxFit.cover),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "flower puff claw clips",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
