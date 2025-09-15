import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 4),
                        Text("216 St Paul’s Rd, London N1 2LL, UK"),
                        Text("Contact : +44-784232"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("Shopping List",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildCartItem(
              context,
              imageUrl:
                  "assets/images/keychains1.jpg", // Replace with your image asset
              title: "keychains",
              variations: ["Black", "Red"],
              rating: 4.8,
              currentPrice: 34,
              oldPrice: 46,
            ),
            const SizedBox(height: 12),

            // Item Card 2
            _buildCartItem(
              context,
              imageUrl:
                  "assets/images/clips2.jpg", // Replace with your image asset
              title: "clips",
              variations: ["Green", "Grey"],
              rating: 4.7,
              currentPrice: 45,
              oldPrice: 57,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context,
      {required String imageUrl,
      required String title,
      required List<String> variations,
      required double rating,
      required double currentPrice,
      required double oldPrice}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 6),
                    Row(
                      children: variations
                          .map((v) => Container(
                                margin: EdgeInsets.only(right: 6),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(v,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orangeAccent),
                        SizedBox(width: 4),
                        Text("$rating",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text("\$$currentPrice",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(width: 8),
                        Text("\$$oldPrice",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text("Total Order (1)",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                Spacer(),
                Text("\$$currentPrice",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
