## Navigation master

~~~~ Dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: DrawerMasterProject(),
      debugShowCheckedModeBanner: false,
    ));

class DrawerMasterProject extends StatelessWidget {
  const DrawerMasterProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // গ্লোবাল কি (GlobalKey) দিয়ে বাটন চেপে ড্রয়ার খোলার জন্য (ঐচ্ছিক)
      appBar: AppBar(
        title: const Text("Lucky & Power Drawer"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      // ১. বাম পাশের ড্রয়ার (সব প্রপার্টি সহ)
      drawer: Drawer(
        // --- ড্রয়ারের সাইজ ও ডিজাইন ---
        width: MediaQuery.of(context).size.width * 0.75, // স্ক্রিনের ৭৫% চওড়া
        elevation: 20, // ছায়া বা শ্যাডো কতটা গাঢ় হবে
        shadowColor: Colors.orangeAccent, // ছায়ার রং
        surfaceTintColor: Colors.white, // ম্যাটেরিয়াল ৩ ডিজাইনের টিন্ট কালার
        
        // ড্রয়ারের শেপ বা আকৃতি (কোণা গোল করা)
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),

        child: Column(
          children: [
            // ২. প্রফেশনাল ইউজার হেডার (UserAccountsDrawerHeader)
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb'),
                  fit: BoxFit.cover,
                  opacity: 0.2, // ব্যাকগ্রাউন্ড ইমেজের ওপর হালকা রং ফুটে উঠবে
                ),
              ),
              accountName: Text(
                "CodeOrbit BD",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("developer@luckypower.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Colors.orange),
              ),
              // ছোট আরও প্রোফাইল পিকচার (যেমন সুইচ অ্যাকাউন্ট)
              otherAccountsPictures: [
                CircleAvatar(backgroundColor: Colors.white54, child: Icon(Icons.add)),
              ],
            ),

            // ৩. মেনু আইটেম (ListView এর বদলে Expanded Column ব্যবহার করা হয়েছে)
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined, color: Colors.orange),
                    title: const Text("Dashboard"),
                    subtitle: const Text("সব আপডেট এখানে"),
                    onTap: () => Navigator.pop(context), // ড্রয়ার বন্ধ করতে
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_collection_outlined),
                    title: const Text("YouTube Tutorials"),
                    onTap: () {},
                  ),
                  
                  // ৪. ডিভাইডার (Divider) - ক্যাটাগরি আলাদা করতে
                  const Divider(thickness: 1, indent: 20, endIndent: 20),

                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text("App Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text("About Developer"),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ৫. ড্রয়ারের নিচে ফুটারে লোগো বা ভার্সন
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Version 1.0.2", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),

      // ৬. ডান পাশের ড্রয়ার (endDrawer)
      endDrawer: Drawer(
        width: 200,
        backgroundColor: Colors.orange.shade50,
        child: const Center(child: Text("এটি ফিল্টার বা নোটিফিকেশন প্যানেল")),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("বামে স্লাইড করুন ড্রয়ারের জন্য"),
            const SizedBox(height: 20),
            // কাস্টম বাটন দিয়ে ড্রয়ার খোলার উপায়
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: const Text("Open Drawer by Button"),
              ),
            ),
          ],
        ),
      ),

~~~~
# ফ্লুটারে দুই ধরনের ড্রয়ার আছে:
১. drawer: এটা লিখলে মেনুটা বাম (Left) পাশ থেকে আসবে।  

২. endDrawer: এটা লিখলে মেনুটা ডান (Right) পাশ থেকে আসবে।

# চলো তোমার এই কোডটার ময়নাতদন্ত করি এবং ড্রয়ারের আরও কী কী বাকি আছে সব দেখে নিই।
১. DrawerHeader vs UserAccountsDrawerHeader 


তুমি DrawerHeader এর ভেতর Column দিয়ে নিজে ডিজাইন করেছ, এটা দারুণ! কিন্তু ফ্লুটারে একটা রেডিমেড উইজেট আছে যা প্রোফাইল দেখানোর জন্য একদম পারফেক্ট। সেটার নাম UserAccountsDrawerHeader।  


তোমার কোডটা আরও প্রফেশনাল হবে এভাবে:
~~~~ Dart

UserAccountsDrawerHeader(
  accountName: Text("Taufiqur Sabbir"),
  accountEmail: Text("a@b.com"),
  currentAccountPicture: CircleAvatar(
    backgroundImage: NetworkImage('https://...'),
  ),
  decoration: BoxDecoration(color: Colors.orange), // ব্যাকগ্রাউন্ড কালার
)
~~~~

# ২. ড্রয়ারের আরও কিছু দারুণ প্রপার্টি (A to Z)

    elevation: ড্রয়ারটা যখন বের হবে, তখন সেটার ছায়া (Shadow) কতটা হবে।

    width: ড্রয়ারটা স্ক্রিনের কতটুকু জায়গা জুড়ে থাকবে (যেমন: width: MediaQuery.of(context).size.width * 0.7)।

    shape: ড্রয়ারের কোনা গোল করার জন্য (যেমন: RoundedRectangleBorder)।

    DrawerController: যদি তুমি বাটন চেপে ড্রয়ার খুলতে বা বন্ধ করতে চাও।

# 🚀 ড্রয়ারের একটি "A to Z" কমপ্লিট প্রজেক্ট কোড

নিচে আমি তোমার কোডটাকে আরও প্রিমিয়াম লুক দিয়ে সাজিয়ে দিচ্ছি। এখানে আমি drawer এবং endDrawer দুটোর আইডিয়াই দিচ্ছি:
~~~~Dart

import 'package:flutter/material.dart';

class FullDrawerProject extends StatelessWidget {
  const FullDrawerProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taufiq's App"),
        backgroundColor: Colors.orange,
      ),
      
      // ১. বাম পাশের ড্রয়ার (Normal Drawer)
      drawer: Drawer(
        width: 280, // ড্রয়ারের চওড়া কমানো-বাড়ানো
        child: ListView(
          padding: EdgeInsets.zero, // হেডার একদম উপরে লেগে থাকবে
          children: [
            // প্রফেশনাল হেডার
            const UserAccountsDrawerHeader(
              accountName: Text("Taufiqur Sabbir", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text("a@b.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'),
              ),
              decoration: BoxDecoration(color: Colors.orange),
            ),

            // মেনু আইটেমগুলো
            ListTile(
              leading: const Icon(Icons.dashboard_outlined, color: Colors.orange),
              title: const Text("Dashboard"),
              onTap: () => Navigator.pop(context), // ড্রয়ার বন্ধ হবে
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Profile"),
              onTap: () {},
            ),
            const Divider(), // একটা হালকা দাগ
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),

      // ২. ডান পাশের ড্রয়ার (যা তুমি ব্যবহার করেছ)
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: const Center(child: Text("এটি নোটিফিকেশন বা ফিল্টার প্যানেল হতে পারে")),
      ),

      body: const Center(
        child: Text("স্লাইড করুন অথবা বাম/ডান দিকের আইকনে চাপ দিন"),
      ),
    );
  }
}
~~~~

#💡 কিছু গুরুত্বপূর্ণ বিষয় যা তোমার জানা দরকার:

    Drawer বন্ধ করা: ড্রয়ারের কোনো মেনুতে ক্লিক করলে কিন্তু ড্রয়ার অটোমেটিক বন্ধ হয় না। তোমাকে ম্যানুয়ালি Navigator.pop(context); লিখতে হবে।

    Scaffold.of(context).openDrawer(): যদি তুমি অ্যাপবারের আইকন ছাড়া নিজের বানানো কোনো বাটন দিয়ে ড্রয়ার খুলতে চাও, তবে এই কোডটি লাগবে।

    Divider: ড্রয়ারের মেনুগুলোর মাঝে ক্যাটাগরি আলাদা করার জন্য Divider() উইজেটটি ব্যবহার করলে দেখতে সুন্দর লাগে।
    );
  }
}
