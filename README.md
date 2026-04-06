## TabBar A to Z মাস্টার কোড
~~~~Dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: TabBarMasterPage(),
      debugShowCheckedModeBanner: false,
    ));

class TabBarMasterPage extends StatelessWidget {
  const TabBarMasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ১. DefaultTabController: length, initialIndex, animationDuration
    return DefaultTabController(
      length: 6, // মোট ৬টি ট্যাব (isScrollable চেক করার জন্য)
      initialIndex: 0, // প্রথম ট্যাবটি ওপেন হবে
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lucky & Power Tab Master"),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,

          // ২. TabBar: bottom প্রোপার্টিতে বসানো হয়েছে
          bottom: const TabBar(
            // --- স্ক্রলিং ও সাইজ ---
            isScrollable: true, // অনেক ট্যাব থাকলে ডানে-বামে সরানো যাবে
            physics: BouncingScrollPhysics(), // স্ক্রল করার স্টাইল

            // --- কালার ও স্টাইল ---
            labelColor: Colors.yellow, // সিলেক্টেড ট্যাবের টেক্সট রং
            unselectedLabelColor: Colors.white70, // আন-সিলেক্টেড ট্যাবের রং
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 14),

            // --- ইন্ডিকেটর (নিচের দাগ) কাস্টমাইজেশন ---
            indicatorColor: Colors.yellow, // নিচের দাগের রং
            indicatorWeight: 5, // দাগের পুরুত্ব
            indicatorSize: TabBarIndicatorSize.tab, // দাগ কি পুরো ট্যাব জুড়ে হবে নাকি শুধু লেখার নিচে (label)
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10), // দাগের চারপাশের গ্যাপ
            
            // কাস্টম ইন্ডিকেটর (পুরো ট্যাবের পেছনে গোল বক্স দিতে চাইলে এটি ব্যবহার করুন)
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: Colors.orangeAccent,
            // ),

            // --- ট্যাব লিস্ট ---
            tabs: [
              Tab(text: "Home", icon: Icon(Icons.home), iconMargin: EdgeInsets.only(bottom: 5)),
              Tab(text: "Hotels", icon: Icon(Icons.hotel)),
              Tab(text: "Flights", icon: Icon(Icons.flight)),
              Tab(text: "Bus", icon: Icon(Icons.bus_alert)),
              Tab(text: "Offers", icon: Icon(Icons.local_offer)),
              Tab(text: "Settings", icon: Icon(Icons.settings)),
            ],
          ),
        ),

        // ৩. TabBarView: এখানে ৬টি চিলড্রেন থাকতে হবে
        body: const TabBarView(
          children: [
            Center(child: Text("Home Content")),
            Center(child: Text("Hotel List")),
            Center(child: Text("Flight Schedule")),
            Center(child: Text("Bus Booking")),
            Center(child: Text("Special Offers")),
            Center(child: Text("App Settings")),
          ],
        ),
      ),
    );
  }
}
~~~~
# নোটে এই পয়েন্টগুলো অবশ্যই রাখবেন:
isScrollable: true: এটি না দিলে অনেকগুলো ট্যাব থাকলে ডিজাইন হিজিবিজি হয়ে যাবে। আপনার Lucky & Power এর বুকিং অ্যাপে অনেক ক্যাটাগরি থাকতে পারে, তাই এটি মনে রাখবেন।  


indicatorSize: আপনি যদি চান ইন্ডিকেটর বা নিচের দাগটি শুধু লেখার সমান হবে, তবে TabBarIndicatorSize.label ব্যবহার করবেন। আর যদি পুরো ট্যাবের সমান চান, তবে tab ব্যবহার করবেন।  


DefaultTabController: এটি ছাড়া কিন্তু TabBar কাজ করবে না, যদি না আপনি আলাদা কোনো TabController (Stateful-এ) বানান।  


iconMargin: আইকন এবং টেক্সটের মাঝখানের দূরত্ব কমাতে বা বাড়াতে এটি খুব কাজের।  
