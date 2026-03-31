import 'package:flutter/material.dart';

class ExpandedFlexibleDemo extends StatelessWidget {
  const ExpandedFlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded vs Flexible")),
      body: Column(
        children: [
          const Text("Expanded (পুরোটা দখল করবে)"),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange,
                  child: const Text("আমি অনেক বড় হতে চাই!"),
                ),
              ),
              Container(width: 50, height: 50, color: Colors.black),
            ],
          ),
          
          const SizedBox(height: 30),

          const Text("Flexible (নিজে ছোট থাকলে ছোটই থাকবে)"),
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose, // চাইল্ড ছোট হলে সে নিজেও ছোট থাকবে
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.green,
                  child: const Text("ছোট লেখা"),
                ),
              ),
              Container(width: 50, height: 50, color: Colors.black),
            ],
          ),
          
          const Divider(height: 50),
          
          const Text("Flex Factor (অনুপাত অনুযায়ী জায়গা নেওয়া)"),
          Row(
            children: [
              Expanded(
                flex: 2, // এটি ২ ভাগ জায়গা নেবে
                child: Container(color: Colors.red, height: 50, child: const Center(child: Text("Flex 2"))),
              ),
              Expanded(
                flex: 1, // এটি ১ ভাগ জায়গা নেবে
                child: Container(color: Colors.blue, height: 50, child: const Center(child: Text("Flex 1"))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}