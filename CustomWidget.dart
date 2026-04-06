import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;

  const BookingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 250,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      // ক্লিপ ব্যবহার করা হয়েছে যাতে ইমেজ রেডিয়াস মেনে চলে
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // ১. ব্যাকগ্রাউন্ড ইমেজ
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // ২. ইমেজের ওপর হালকা অন্ধকার আবরণ (Gradient Overlay)
            // এটি দেয়া হয় যাতে সাদা টেক্সট স্পষ্টভাবে বোঝা যায়
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),

            // ৩. টেক্সট কন্টেন্ট
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white70, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ৪. প্রাইস ট্যাগ (উপরে ডান পাশে)
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '\$$price',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}