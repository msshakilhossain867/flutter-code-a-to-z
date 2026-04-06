# flutter-code-a-to-z

প্রো-টিপ (Flex Factor):

ভাই, আপনি যদি চান একটা লাইনে দুইটা বক্স থাকবে, একটা হবে দ্বিগুণ বড় আর অন্যটা ছোট—তখন flex ব্যবহার করবেন।

flex: 2 এবং flex: 1 দিলে মোট ৩ ভাগ হবে। বড়টা পাবে ২ ভাগ আর ছোটটা পাবে ১ ভাগ। এটা রেসপনসিভ লেআউটের জন্য জাদুর মতো কাজ করে!


 ## ৩. Wrap-এর প্রধান ৪টি প্রপার্টি (A to Z Guide): ##

   spacing: পাশাপাশি উইজেটগুলোর মাঝখানে কতটুকু ফাঁকা থাকবে। (Row এর মত)।

   runSpacing: যদি উইজেট নিচের লাইনে চলে যায়, তবে আগের লাইনের সাথে পরের লাইনের গ্যাপ কত হবে।

   alignment: প্রথম লাইনের উইজেটগুলো কোথায় থাকবে? (শুরুতে, মাঝে নাকি শেষে)।

   runAlignment: পুরো লাইনের সেটগুলো স্ক্রিনের কোথায় থাকবে।


  # ১. LayoutBuilder (বাবার সাইজ অনুযায়ী কাজ করা)

LayoutBuilder আপনাকে বলে দেয় যে—আপনার উইজেটটা এখন যে জায়গায় আছে, সেখানে তার সর্বোচ্চ (Max) এবং সর্বনিম্ন (Min) চওড়া (Width) এবং লম্বা (Height) কতটুকু।

    কেন কাজে লাগে? স্ক্রিন সাইজ যা-ই হোক, যদি চওড়া ৬০০ পিক্সেলের বেশি হয় তবে ২টা কলাম দেখাও, আর কম হলে ১টা—এই লজিক দিতে এটা সেরা।

    নেটিভ উদাহরণ: এটা অনেকটা অ্যান্ড্রয়েডের ConstraintLayout-এর মতো কাজ করে যেখানে চাইল্ড তার প্যারেন্টের সাইজ জানে।

~~~~ Dart

LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return _buildWideLayout(); // বড় স্ক্রিনের জন্য
    } else {
      return _buildNarrowLayout(); // ছোট স্ক্রিনের জন্য (মোবাইল)
    }
  },
)
~~~~

# ২. OrientationBuilder (ফোন কাত করলে কী হবে?)

ইউজার যখন ফোনটাকে সোজা (Portrait) থেকে কাত (Landscape) করে, তখন অ্যাপের ডিজাইন বদলে দেওয়ার জন্য এটি ব্যবহার হয়।

    Portrait: ফোন সোজা থাকলে।

    Landscape: ফোন কাত করলে।

    নেটিভ উদাহরণ: অ্যান্ড্রয়েডে যেমন layout-land ফোল্ডার দিয়ে আলাদা ডিজাইন করতে হয়, ফ্লাটারে শুধু এই উইজেট দিলেই কাজ শেষ।

~~~~ Dart

OrientationBuilder(
  builder: (context, orientation) {
    return GridView.count(
      // সোজা থাকলে ২টা কলাম, কাত করলে ৩টা কলাম
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(10, (index) => Card(child: Center(child: Text('Item $index')))),
    );
  },
)
~~~~

# ৩. DevicePreview (সব ফোন এক জায়গায় টেস্ট করা)

আপনার কাছে তো সব ব্র্যান্ডের ফোন বা ট্যাব নেই। তাহলে টেস্ট করবেন কীভাবে? DevicePreview হলো একটা প্যাকেজ যা আপনার ল্যাপটপের স্ক্রিনেই iPhone, iPad, Samsung বা ছোট বাটন ফোনের লুক এনে দেয়।

    কিভাবে ব্যবহার করবেন?
    ১. pubspec.yaml-এ device_preview: ^1.2.0 অ্যাড করুন।
    ২. main.dart-এ গিয়ে runApp এর ভেতর এটাকে মুড়িয়ে দিন।

~~~~ Dart

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // শুধু ডেভেলপমেন্টের সময় true রাখবেন
      builder: (context) => MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // এটি মাস্ট!
      locale: DevicePreview.locale(context), // ভাষা টেস্টের জন্য
      builder: DevicePreview.appBuilder, // প্রিভিউ দেখানোর জন্য
      home: MyResponsivePage(),
    );
  }
}
~~~~

# 🛠️ একটি "Responsive A to Z" প্রজেক্ট কোড

এই কোডটিতে আমি LayoutBuilder এবং OrientationBuilder একসাথে ব্যবহার করে দেখাচ্ছি:
~~~~ Dart

import 'package:flutter/material.dart';

class ResponsiveMaster extends StatelessWidget {
  const ResponsiveMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Mastery")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // ১. চেক করছি স্ক্রিন কি বড় (ট্যাব বা ওয়েব)?
          if (constraints.maxWidth > 600) {
            return _buildDesktopLayout();
          } else {
            // ২. ছোট স্ক্রিন হলে চেক করছি কাত করা কি না?
            return OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? _buildMobilePortrait()
                    : _buildMobileLandscape();
              },
            );
          }
        },
      ),
    );
  }

  // বিভিন্ন লেআউট হেল্পার
  Widget _buildDesktopLayout() => Center(child: Text("SideBar + Main Content (Desktop Mode)"));
  Widget _buildMobilePortrait() => Center(child: Text("Single Column (Mobile Portrait)"));
  Widget _buildMobileLandscape() => Center(child: Text("Row of Cards (Mobile Landscape)"));
}
~~~~

💡 প্রো-টিপ (MediaQuery vs LayoutBuilder):

অনেকে কনফিউজড হয়ে যায় কোনটি ব্যবহার করবে।

    MediaQuery: এটি পুরো স্ক্রিনের সাইজ দেয়। (যেমন: পুরো ফোনের স্ক্রিন কত বড়?)

    LayoutBuilder: এটি তার প্যারেন্টের সাইজ দেয়। (যেমন: একটা ছোট বক্সের ভেতর কতটুকু জায়গা আছে?)

পরবর্তী ধাপ:
# next

সহজ কথায়: আপনার কাছে একটা বিস্কুটের প্যাকেট (Row/Column) আছে, আর ভেতরে বিস্কুট (Widgets) আছে। কোনো বিস্কুট বড় হবে আর কোনটা ছোট থাকবে, এটাই এদের কাজ।
# ১. Expanded (জোর করে সব জায়গা দখল করা)

Expanded উইজেটটা হলো একটু "স্বার্থপর" টাইপের। সে তার পাশের উইজেটগুলো জায়গা নেওয়ার পর যতটুকু খালি জায়গা পায়, তার পুরোটা জোর করে দখল করে নেয়।

    বৈশিষ্ট্য: এটি চাইল্ড উইজেটকে টেনে লম্বা বা চওড়া করে ফেলে যাতে কোনো জায়গা খালি না থাকে।

    কখন ব্যবহার করবেন: যখন চান কোনো উইজেট স্ক্রিনের বাকি সবটুকু খালি জায়গা জুড়ে থাকুক।

~~~~ Dart

Row(
  children: [
    Container(width: 50, color: Colors.red), // ফিক্সড সাইজ
    Expanded(
      child: Container(color: Colors.green), // বাকি সব জায়গা সে নিয়ে নেবে
    ),
    Container(width: 50, color: Colors.blue), // ফিক্সড সাইজ
  ],
)
~~~~

# ২. Flexible (প্রয়োজন অনুযায়ী জায়গা নেওয়া)

Flexible উইজেটটা হলো "ভদ্র"। সে খালি জায়গা দখল করতে পারে, কিন্তু সে চাইল্ড উইজেটকে জোর করে টেনে বড় করে না। চাইল্ডের সাইজ যতটুকু, সে ততটুকুই থাকে, কিন্তু তাকে সর্বোচ্চ কতটুকু জায়গা দেওয়া যাবে সেই সীমা (Limit) ঠিক করে দেয়।

    বৈশিষ্ট্য: এটি চাইল্ডকে তার নিজের সাইজ বজায় রাখতে দেয় (যদি fit: FlexFit.loose থাকে)।

    কখন ব্যবহার করবেন: যখন চান একটা উইজেট বড় হতে পারবে কিন্তু তার কন্টেন্ট ছোট হলে সে নিজেও ছোট হয়ে থাকবে।

# ৩. এদের আসল পার্থক্য (The Magic Property: fit)

সব খেলা হলো fit প্রপার্টিতে। আসলে Expanded হলো Flexible-এর একটা স্পেশাল রূপ।

উইজেট	ডিফল্ট ফিট (Default Fit)	কাজ কী?

Expanded	FlexFit.tight	খালি জায়গা যতটুকু আছে, সবটুকু পূরণ করতেই হবে।

Flexible	FlexFit.loose	খালি জায়গার মধ্যে নিজের সাইজ অনুযায়ী থাকবে, জোর করে বড় হবে না।

🚀 প্রাক্টিক্যাল উদাহরণ (A to Z Code)

এই কোডটি রান করলে আপনি পার্থক্যটা একদম পরিষ্কার বুঝতে পারবেন:
~~~Dart

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
~~~~

💡 প্রো-টিপ (Flex Factor):

ভাই, আপনি যদি চান একটা লাইনে দুইটা বক্স থাকবে, একটা হবে দ্বিগুণ বড় আর অন্যটা ছোট—তখন flex ব্যবহার করবেন।

    flex: 2 এবং flex: 1 দিলে মোট ৩ ভাগ হবে। বড়টা পাবে ২ ভাগ আর ছোটটা পাবে ১ ভাগ। এটা রেসপনসিভ লেআউটের জন্য জাদুর মতো কাজ করে!
