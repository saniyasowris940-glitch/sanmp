import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/constants/colors.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final List<String> images = [
  //   'assets/bouquet1.jpg',
  //   'assets/clip2.jpg',
  //   'assets/key7.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      appBar: AppBar(
        title: Text(
          "Little Crochet",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Appcolors.third),
          textAlign: TextAlign.center,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        SizedBox(height: 30),
        ]),
      ),
    );
  }
}
