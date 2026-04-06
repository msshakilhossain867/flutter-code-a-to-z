import 'package:flutter/material.dart';
// আপনার ফাইল পাথ অনুযায়ী ইমপোর্ট ঠিক আছে কিনা দেখে নিন
import 'package:love_you/practice/CustomWidget.dart'; 

class Custmwdg extends StatelessWidget {
  const Custmwdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar দিলে দেখতে সুন্দর লাগবে
      appBar: AppBar(title: const Text("Booking Apps")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // চিলড্রেনগুলো const করার দরকার নেই যদি না তারা স্ট্যাটিক হয়
        child: Row(
          children: [
            BookingCard(
              imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945',
              title: 'Grand Palace Hotel',
              location: 'Cox\'s Bazar, Bangladesh',
              price: '120',
            ),
            BookingCard(
              imageUrl: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
              title: 'Ocean Blue Resort',
              location: 'Saint Martin, BD',
              price: '150',
            ),
          ],
        ),
      ),
    );
  }
}



    