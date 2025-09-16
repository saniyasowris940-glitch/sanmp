import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Placeorder extends StatefulWidget {
  const Placeorder({super.key});

  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  int _selectedQty = 1;
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
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/clips2.jpg",
                            height: 100, width: 80, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 16),
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
                            DropdownButton<int>(
                              value: _selectedQty,
                              items: List.generate(10, (index) => index + 1)
                                  .map((qty) => DropdownMenuItem(
                                        value: qty,
                                        child: Text("qty: $qty"),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedQty = value!;
                                });
                              },
                            ),
                            SizedBox(height: 6),
                            Text("Delivery: 10 May 20XX"),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
