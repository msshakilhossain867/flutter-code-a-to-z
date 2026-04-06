# Navigator a to z

১. Navigator A to Z সম্পূর্ণ ফাইল
Dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

// ------------------- FIRST PAGE -------------------
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page (Navigator A-Z)")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ১. Navigator.push : সাধারণ এক পেজ থেকে অন্য পেজে যাওয়া
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text("Go to Second Page (Push)"),
              ),

              // ২. Data Passing : পরের পেজে ডেটা পাঠানো
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataPage(name: "Lucky & Power", age: 25),
                    ),
                  );
                },
                child: const Text("Pass Data to Next Page"),
              ),

              // ৩. Navigator.pushReplacement : আগের পেজ ডিলিট করে নতুন পেজে যাওয়া (লগইনের জন্য সেরা)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text("Replace Current Page"),
              ),

              // ৪. Navigator.pushAndRemoveUntil : সব আগের পেজ ডিলিট করে হোম পেজে যাওয়া
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                    (route) => false, // আগের সব রুট ডিলিট করে দিবে
                  );
                },
                child: const Text("Clear Stack and Go Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------- SECOND PAGE -------------------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Second Page"),
            const SizedBox(height: 20),
            // ৫. Navigator.pop : আগের পেজে ফিরে আসা
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back (Pop)"),
            ),
            
            // ৬. Navigator.canPop : চেক করা যাবে কি না (Safety Check)
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Pop if Possible"),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------- DATA PAGE (Passing Data) -------------------
class DataPage extends StatelessWidget {
  final String name;
  final int age;

  const DataPage({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Result Page")),
      body: Center(
        child: Text("Received Name: $name\nAge: $age", 
          style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
      ),
    );
  }
}
২. গুরুত্বপূর্ণ নেভিগেটর মেথডসমূহের ব্যাখ্যা (A to Z)
মেথড (Method)	কাজ (Function)	কখন ব্যবহার করবেন?
Navigator.push	নতুন একটি পেজ স্ট্যাকের ওপর যোগ করে।	সাধারণ নেভিগেশনের জন্য।
Navigator.pop	বর্তমান পেজটি সরিয়ে আগের পেজে ফিরে যায়।	ব্যাক বাটন বা ক্লোজ বাটনের জন্য।
Navigator.pushReplacement	বর্তমান পেজটি সরিয়ে নতুন পেজ আনে।	লগইন করার পর লগইন পেজ সরিয়ে ড্যাশবোর্ডে যেতে।
Navigator.pushAndRemoveUntil	আগের সব পেজ রিমুভ করে একদম ফ্রেশ ভাবে নতুন পেজে যায়।	লগআউট করার পর বা একদম শুরুতে ফিরে যেতে।
Navigator.canPop	চেক করে দেখে ব্যাকে যাওয়ার মতো কোনো পেজ আছে কি না।	অ্যাপ ক্র্যাশ হওয়া থেকে বাঁচাতে (Boolean রিটার্ন করে)।
Navigator.maybePop	যদি ব্যাকে যাওয়ার জায়গা থাকে তবেই পপ করবে।	ইউজার যেন ভুল করে অ্যাপ থেকে বের না হয়ে যায়।
৩. প্রফেশনাল টিপস (Named Routes)
আপনি যদি বড় প্রজেক্ট করেন (যেমন আপনার Lucky & Power ব্র্যান্ডের বড় কোনো অ্যাপ), তবে MaterialPageRoute বারবার না লিখে Named Routes ব্যবহার করা ভালো।

MaterialApp-এর ভেতর রুটগুলো এভাবে ডিফাইন করা যায়:

Dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const FirstPage(),
    '/second': (context) => const SecondPage(),
  },
);

// ব্যবহার করার সময়:
Navigator.pushNamed(context, '/second');
এই পুরো লজিকটি আপনার CodeOrbit BD চ্যানেলের টিউটোরিয়ালের জন্য একটি সলিড বেস হিসেবে কাজ করবে। এটি প্র্যাকটিস করুন, নেভিগেশন নিয়ে আর কোনো ডাউট থাকবে না! কোনো এরর আসলে জানাবেন।
