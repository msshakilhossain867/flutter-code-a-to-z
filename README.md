# Stateful Widget

# চলো একদম A to Z ময়নাতদন্ত করি:
## ১. কেন এটা দরকার? (The Power of setState)

ফ্লুটারে যখন তুমি কোনো ভেরিয়েবলের মান পরিবর্তন করো (যেমন: count++), ফ্লুটার নিজে থেকে স্ক্রিন আপডেট করে না। তাকে ধাক্কা দিয়ে বলতে হয়— "ভাই, ডাটা চেঞ্জ হয়েছে, স্ক্রিনটা আবার নতুন করে আঁকো (Rebuild)!" এই ধাক্কা দেওয়ার কাজটাই করে setState(() { ... });।
# ২. এর প্রধান ৩টি জীবনচক্র (Life Cycle)

Stateful উইজেটের নিজের একটা জীবন আছে। এটি ৩টি ধাপে কাজ করে:

    initState(): এটি অ্যাপের শুরুতে একবারই কল হয়। ডাটাবেজ থেকে ডাটা আনা বা অ্যানিমেশন কন্ট্রোলার শুরু করার জন্য এটি পারফেক্ট।

    build(): এটি বারবার কল হয় যখনই তুমি setState করো। এটাই স্ক্রিনে সবকিছু দেখায়।

    dispose(): যখন ইউজার ওই পেজ থেকে চলে যায়, তখন এটি কল হয়। মেমোরি পরিষ্কার করার জন্য এটি দরকার (যেমন: কন্ট্রোলার বন্ধ করা)।

# ৩. একটি পূর্ণাঙ্গ "Counter & Input" প্রজেক্ট (A to Z)

এই কোডটি দেখো, এখানে আমি তোমার জন্য একটি সুন্দর লজিক সেট করেছি:
~~~~ Dart

import 'package:flutter/material.dart';

class MyStatefulApp extends StatefulWidget {
  const MyStatefulApp({super.key});

  // এটি একটি স্টেট তৈরি করে
  @override
  State<MyStatefulApp> createState() => _MyStatefulAppState();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  // ১. ভেরিয়েবল (এখানে আমাদের ডাটা থাকবে)
  int _counter = 0;
  String _message = "স্বাগতম ভাই!";
  bool _isLiked = false;

  // ২. ফাংশন (লজিক পরিবর্তন করার জন্য)
  void _updateCounter() {
    setState(() {
      _counter++; // মান বাড়ালাম
      if (_counter == 10) {
        _message = "অভিনন্দন! ১০ পূর্ণ হলো!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Mastery")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 22, color: Colors.blue)),
            const SizedBox(height: 10),
            Text("Counter: $_counter", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 30),
            
            // লাইক বাটন অ্যানিমেশন ছাড়াই স্টেট দিয়ে চেঞ্জ করা
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
                size: 50,
              ),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked; // ট্রু থাকলে ফলস হবে, ফলস থাকলে ট্রু
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateCounter, // বাটন ক্লিক করলে ফাংশন কল হবে
        child: const Icon(Icons.add),
      ),
    );
  }
}
 ~~~~

# ৪. কি কি ভুল হতে পারে? (Common Mistakes)

    setState এর বাইরে ডাটা চেঞ্জ করা: যদি তুমি _counter++ করো কিন্তু setState এর ভেতর না রাখো, তবে কাউন্টার বাড়বে ঠিকই কিন্তু স্ক্রিনে সবসময় আগের সংখ্যাটাই দেখাবে।

    অকারণে setState ব্যবহার: যদি কোনো ডাটা স্ক্রিনে দেখানোর দরকার না হয়, তবে সেটা setState এর ভেতর রাখার দরকার নেই। এতে অ্যাপের পারফরম্যান্স ভালো থাকে।
