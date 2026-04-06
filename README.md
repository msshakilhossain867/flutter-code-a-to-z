## life cycle master

# কেন এটা বুঝতে হবে? (The "Why")

১. মেমোরি সেভ করা: ধরো তুমি একটা মিউজিক প্লেয়ার বানাচ্ছ। ইউজার যখন ওই পেজ থেকে বের হয়ে গেল, তখনো যদি গানটা ব্যাকগ্রাউন্ডে চলতেই থাকে, তবে ফোনের চার্জ আর র‍্যাম শেষ হয়ে যাবে। এটা বন্ধ করার জন্য জীবনচক্রের শেষ ধাপ (Dispose) বুঝতে হবে।

২. অটোমেটিক ডাটা লোড: পেজটা ওপেন হওয়ার সাথে সাথেই যদি ইন্টারনেট থেকে ডাটা আনতে চাও, তবে সেটা কোন জায়গায় লিখবে? সেটা জানার জন্য প্রথম ধাপ (InitState) বুঝতে হবে।

৩. অ্যানিমেশন কন্ট্রোল: অ্যানিমেশন কখন শুরু হবে আর কখন বন্ধ হবে, সেটা কন্ট্রোল করার জন্য লাইফ সাইকেল মাস্ট।

# প্রধান ৪টি ধাপ (কখন কোনটা কাজে লাগবে):
# ১. initState() (জন্ম বা শুরু)

এটি উইজেটটা তৈরি হওয়ার ঠিক পরেই একবারই কল হয়।

    কখন কাজে লাগবে:

        ইন্টারনেট থেকে এপিআই (API) কল করে ডাটা আনতে।

        কোনো ভেরিয়েবলের শুরুর মান (Initial Value) সেট করতে।

        অ্যানিমেশন কন্ট্রোলার বা টেক্সট কন্ট্রোলার শুরু করতে।

~~~~ Dart

@override
void initState() {
  super.initState();
  print("উইজেট তৈরি হয়েছে! এখন ডাটা লোড করছি...");
}
~~~~

# ২. didChangeDependencies() (পরিবেশ পরিবর্তন)

এটি initState এর ঠিক পরেই কল হয়।

    কখন কাজে লাগবে:

        যদি তোমার পেজে কোনো থিম বা ল্যাঙ্গুয়েজ চেঞ্জ হয় (যেমন: ডার্ক মোড থেকে লাইট মোড)।

        যদি তুমি MediaQuery বা Provider এর ডাটা প্রথমবার রিসিভ করতে চাও।

# ৩. build() (কাজ বা পারফরম্যান্স)

এটি বারবার কল হয়। যতবার তুমি setState করবে, ততবার এটি রান হবে।

    কাজ: এটি শুধু স্ক্রিনে UI আঁকার কাজ করে। এখানে কোনো ভারী লজিক (যেমন API কল) রাখা নিষেধ, কারণ এটা বারবার চলে।

# ৪. dispose() (মৃত্যু বা শেষ)

উইজেটটা যখন স্ক্রিন থেকে চিরতরে মুছে যায় (যেমন ইউজার ব্যাক বাটনে চাপ দিল), তখন এটি কল হয়।

    কখন কাজে লাগবে:

        ভিডিও প্লেয়ার বা মিউজিক প্লেয়ার বন্ধ করতে।

        ডাটাবেজ কানেকশন ক্লোজ করতে।

        কন্ট্রোলারগুলো মুছে ফেলে ফোনের র‍্যাম (RAM) খালি করতে।

~~~~ Dart

@override
void dispose() {
  print("পেজ বন্ধ হয়ে গেল, সব মেমোরি খালি করছি...");
  myController.dispose(); // মেমোরি লিক ঠেকানোর উপায়
  super.dispose();
}
~~~~

বাস্তব জীবনের উদাহরণ (রিয়েল লাইফ সিনারিও):


ধরো তুমি একটা Clock App বানাচ্ছ যেটা প্রতি সেকেন্ডে সময় দেখাবে।

    initState: এখানে তুমি একটা টাইমার শুরু করবে যা প্রতি সেকেন্ডে টিকটিক করবে।

    setState: টাইমার যখন প্রতি সেকেন্ডে ভ্যালু চেঞ্জ করবে, তুমি setState কল করবে যাতে build মেথডটা নতুন সময়টা দেখায়।

    dispose: ইউজার যখন ঘড়ির পেজ থেকে বের হয়ে যাবে, তখন এই dispose-এর ভেতর টাইমারটা বন্ধ করে দিতে হবে। নাহলে অ্যাপের ভেতরে টাইমারটা সারাজীবন চলতেই থাকবে আর ফোন গরম হবে!

# 🚀 একটা "A to Z" লাইফ সাইকেল ডেমো কোড:

এই কোডটা রান করে কনসোলে (Debug Console) তাকালে তুমি নিজেই বুঝে যাবে কে আগে আসছে আর কে পরে।
~~~~ Dart

import 'package:flutter/material.dart';

class LifeCycleDemo extends StatefulWidget {
  const LifeCycleDemo({super.key});

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  
  @override
  void initState() {
    super.initState();
    print("১. initState: আমি জন্মালাম! ডাটা লোড শুরু করছি...");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("২. didChangeDependencies: পরিবেশ চেক করলাম...");
  }

  @override
  void dispose() {
    print("৪. dispose: বিদায় পৃথিবী! আমি মেমোরি খালি করে দিচ্ছি...");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("৩. build: আমি স্ক্রিন আঁকছি...");
    return Scaffold(
      appBar: AppBar(title: const Text("Life Cycle Check")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => setState(() {}), // বিল্ড মেথডকে আবার কল করবে
          child: const Text("Re-build Page"),
        ),
      ),
    );
  }
}
~~~~

ভাই, এই ৪টা ধাপ বুঝলে তুমি ফ্লুটারের মেমোরি লিক (Memory Leak) আর অ্যাপ ক্রাশ হওয়া থেকে বাঁচতে পারবে।


-----------------------------------------------------------------------

## চলো অ্যান্ড্রয়েডের Activity Lifecycle-এর সাথে তুলনা করে দেখি:
# ১. initState() ≈ onCreate()

অ্যান্ড্রয়েডে যেমন একটা অ্যাক্টিভিটি শুরু হলে সবার আগে onCreate() কল হয় এবং এখানে তুমি setContentView বা বাটন ডিক্লেয়ার করো, ঠিক তেমনি:

    ফ্লাটারে: initState হলো সেই শুরুর জায়গা।

    কেন কাজে লাগে: অ্যাপের শুরুতে একবারই যে কাজগুলো করতে হয়। যেমন: ডেটাবেজ ওপেন করা বা কন্ট্রোলার শুরু করা।

# ২. didChangeDependencies() ≈ onStart() / onResume() (একটু ভিন্নভাবে)

অ্যান্ড্রয়েডে যেমন অ্যাক্টিভিটিটা স্ক্রিনে আসার ঠিক আগে onStart() হয়, ফ্লাটারে didChangeDependencies() তখন কল হয় যখন তোমার উইজেটের "পরিবেশ" (Dependencies) প্রথমবার তৈরি হয়।

    কেন কাজে লাগে: যদি তোমার অ্যাপের থিম (Dark/Light mode) বা ভাষা পরিবর্তনের ওপর ভিত্তি করে কিছু করতে হয়, তবে এটি সেরা জায়গা।

# ৩. build() ≈ onDraw() বা XML Rendering

অ্যান্ড্রয়েডে যেমন XML লেআউটটা স্ক্রিনে আঁকা হয়, ফ্লাটারে build() মেথডটা ঠিক সেই কাজই করে।

    পার্থক্য: অ্যান্ড্রয়েডে একবার ড্র হয়ে গেলে সাধারণত চুপ থাকে। কিন্তু ফ্লাটারে যতবার তুমি setState() কল করবে, ততবার এই build() মেথডটা আবার রান হবে (Re-render)।

# ৪. dispose() ≈ onDestroy()

অ্যান্ড্রয়েডে যখন তুমি finish() কল করো বা ব্যাক বাটনে চাপ দাও, তখন যেমন onDestroy() কল হয়ে সব মেমোরি খালি করে দেয়, ঠিক তেমনি:

    ফ্লাটারে: dispose হলো সেই শেষ বিদায়।

    কেন কাজে লাগে: যদি কোনো লিসেনার (Listener) বা টাইমার চালু থাকে, তবে সেগুলো এখানে বন্ধ করতে হয়। নাহলে অ্যাপ ব্যাকগ্রাউন্ডে র‍্যাম (RAM) খাবে—যাকে আমরা বলি Memory Leak।

# 📊 এক নজরে নেটিভ বনাম ফ্লাটার:
অ্যান্ড্রয়েড (Native)	ফ্লাটার (Stateful)	কখন ব্যবহার করবে?

onCreate()	initState()	একবারই রান হয়, শুরুতে ডাটা লোড করতে।

XML / View	build()	স্ক্রিনে যা যা দেখা যাচ্ছে তা তৈরি করতে।

onPause() / onStop()	deactivate()	উইজেটটা যখন সাময়িকভাবে স্ক্রিন থেকে সরে যায়।

onDestroy()	dispose()	চিরতরে মুছে যাওয়ার সময় মেমোরি খালি করতে।

💡 কেন এটা জানতেই হবে? (বাস্তব উদাহরণ)

ধরো তুমি একটা Google Map ব্যবহার করছো তোমার অ্যাপে:

    initState: ম্যাপের লাইব্রেরিটা লোড করলে।

    build: স্ক্রিনে ম্যাপটা দেখালে।

    ইউজার ব্যাক বাটন চাপলো: এখন যদি তুমি ম্যাপটা dispose না করো, তবে জিপিএস (GPS) চালু থেকে যাবে এবং ইউজারের ফোনের ব্যাটারি দ্রুত শেষ হয়ে যাবে। নেটিভের মতো এখানেও dispose-এ গিয়ে জিপিএস লিসেনার বন্ধ করতে হবে।

# 🚀 একটি সম্পূর্ণ প্রজেক্ট: "Smart User Input" (Stateful + Life Cycle)

ভাই, যেহেতু লাইফ সাইকেল বুঝে গেছো, এখন চলো একটা A to Z প্রজেক্ট করি যেখানে আমরা ইউজারের নাম ইনপুট নিবো এবং লাইফ সাইকেল ব্যবহার করে মেমোরি ক্লিন রাখবো।
~~~~ Dart

import 'package:flutter/material.dart';

class UserInputProject extends StatefulWidget {
  const UserInputProject({super.key});

  @override
  State<UserInputProject> createState() => _UserInputProjectState();
}

class _UserInputProjectState extends State<UserInputProject> {
  // ১. কন্ট্রোলার ডিক্লেয়ার করা (Native-এর ভেরিয়েবলের মতো)
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    // ২. মেমোরিতে কন্ট্রোলারটি তৈরি করা (onCreate-এর মতো)
    _nameController = TextEditingController();
    print("initState: কন্ট্রোলার তৈরি হলো");
  }

  @override
  void dispose() {
    // ৩. মেমোরি খালি করা (onDestroy-এর মতো)
    _nameController.dispose();
    print("dispose: কন্ট্রোলার ডিলিট হলো");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Enter Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // setState দিয়ে স্ক্রিন আপডেট করা
                setState(() {}); 
              },
              child: const Text("Show Name"),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome, ${_nameController.text}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
 ~~~~


______________________________________________________

ওরে ভাই, একদম ঠিক ধরেছ! didUpdateWidget হলো লাইফ সাইকেলের সেই স্পেশাল মেম্বার যাকে অনেকেই এড়িয়ে যায়, কিন্তু বড় প্রজেক্টে এর গুরুত্ব অপরিসীম।

নেটিভ অ্যান্ড্রয়েডের সাথে তুলনা করলে এটি অনেকটা onNewIntent বা যখন কোনো ফ্র্যাগমেন্টের Arguments আপডেট হয় তখনকার মতো কাজ করে।

চলো একদম সহজভাবে বুঝি:
# ১. এটা কখন কল হয়? (The Trigger)

যখন কোনো Parent (বাবা) উইজেট তার Child (সন্তান) উইজেটকে নতুন কোনো ডাটা দিয়ে পুনরায় তৈরি (Rebuild) করে, তখন চাইল্ড উইজেটের ভেতর এই didUpdateWidget কল হয়।

সহজ কথায়: উইজেটটা স্ক্রিনে আগের মতোই আছে (অর্থাৎ initState আর হবে না), কিন্তু তার ওপরের লেভেল থেকে কোনো কনফিগারেশন বা ডাটা চেঞ্জ হয়ে এসেছে।
# ২. কেন এটা ব্যবহার করবে? (Real-life Scenario)

ধরো, তোমার একটা ClockWidget আছে যেটা প্রতি সেকেন্ডে সময় দেখায়। এখন প্যারেন্ট উইজেট থেকে তুমি ওই ঘড়ির কালার "লাল" থেকে "নীল" করে দিলে।

    ঘড়িটা কিন্তু নতুন করে জন্মাবে না (initState কল হবে না)।

    কিন্তু তাকে তো নীল রঙে আপডেট হতে হবে।

    এই আপডেটের খবরটা সে পায় didUpdateWidget-এ।

# ৩. কোড দিয়ে ময়নাতদন্ত (A to Z Example)

এখানে ২টা উইজেট আছে: ParentWidget এবং ChildWidget।
~~~~ Dart

// চাইল্ড উইজেট
class MyCounterDisplay extends StatefulWidget {
  final int number; // প্যারেন্ট থেকে আসা ডাটা
  const MyCounterDisplay({super.key, required this.number});

  @override
  State<MyCounterDisplay> createState() => _MyCounterDisplayState();
}

class _MyCounterDisplayState extends State<MyCounterDisplay> {
  
  @override
  void initState() {
    super.initState();
    print("initState: প্রথমবার তৈরি হলো");
  }

  // --- এটাই সেই স্পেশাল মেথড ---
  @override
  void didUpdateWidget(covariant MyCounterDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // পুরানো উইজেটের ডাটার সাথে নতুন উইজেটের ডাটা তুলনা করা যায়
    if (oldWidget.number != widget.number) {
      print("didUpdateWidget: ডাটা চেঞ্জ হয়েছে! পুরাতন: ${oldWidget.number}, নতুন: ${widget.number}");
      
      // এখানে তুমি চাইলে নতুন ডাটা অনুযায়ী কোনো অ্যানিমেশন বা এপিআই কল করতে পারো
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build: স্ক্রিন আপডেট হচ্ছে");
    return Text("Number: ${widget.number}", style: const TextStyle(fontSize: 30));
  }
}
~~~~

# ৪. didUpdateWidget এর ৩টি গোল্ডেন রুলস:

    Old vs New: এটি তোমাকে oldWidget নামে একটা প্যারামিটার দেয়। এটা দিয়ে তুমি চেক করতে পারো আসলে কোন জিনিসটা চেঞ্জ হয়েছে। (যেমন: if (oldWidget.color != widget.color))

    No initState: মনে রাখবে, এটি কল হওয়া মানে উইজেটটা মরেনি বা নতুন করে জন্মায়নি, শুধু সে "আপডেট" হয়েছে। তাই এখানে নতুন করে কন্ট্রোলার ডিক্লেয়ার করবে না।

    setState দরকার নেই: সাধারণত didUpdateWidget এর পর ফ্লুটার অটোমেটিক build মেথড কল করে। তবে যদি এই আপডেটের ওপর ভিত্তি করে তুমি ইন্টারনাল কোনো ভেরিয়েবল চেঞ্জ করো, তখন setState লাগতে পারে।

# ৫. সব লাইফ সাইকেল একসাথে (A to Z Summary)

একদম নেটিভ স্টাইলে সিরিয়ালটা মনে রাখো:

    initState: জন্ম (একবার)।

    didChangeDependencies: পরিবেশ পরিচিতি (একবার বা থিম চেঞ্জ হলে)।

    build: কাজ দেখানো (বারবার)।

    didUpdateWidget: ওপর থেকে ডাটা চেঞ্জ হয়ে আসলে (বারবার)।

    deactivate: সাময়িক বিরতি।

    dispose: মৃত্যু বা বিদায় (একবার)।


 
  কদম খাঁটি কথা ভাই! তুমি একদম সিরিয়াল অনুযায়ী ধরে ফেলেছো। নেটিভ অ্যান্ড্রয়েডে যেমন একটা নির্দিষ্ট সিকোয়েন্স থাকে, ফ্লুটারেও ঠিক এইভাবেই ধাপগুলো একটার পর একটা আসে।

তবে তোমার লিস্টে didUpdateWidget এর পজিশনটা নিয়ে একটু কনফিউশন থাকতে পারে, কারণ এটা তো আর সব সময় কল হয় না। চলো তোমার এই সিরিয়ালটাকে একদম প্রফেশনাল লেভেলে সাজিয়ে দিই:
# 🚀 ফ্লাটার লাইফ সাইকেলের একদম সঠিক সিরিয়াল (A to Z)

# ১. Constructor: এটি সবার আগে কল হয়। যখন তুমি তোমার উইজেটটা কোথাও কল করো (যেমন: MyWidget()), তখনই এর জন্ম শুরু।

# ২. createState(): এটি StatefulWidget-এর সেই অংশ যা স্টেটফুল উইজেট আর তার স্টেটকে (Logic) কানেক্ট করে।

# ৩. initState(): এটি স্টেটের জন্ম। এখানে তুমি কন্ট্রোলার বা এপিআই কলের কাজ শুরু করো। (একবারই কল হয়)।

# ৪. didChangeDependencies(): এটি initState এর ঠিক পরেই কল হয়। এখানে তুমি MediaQuery বা Theme এর ডাটা প্রথমবার পাও।

# ৫. build(): এটি হলো আসল কারিগর। এটি বারবার কল হয় যখনই স্ক্রিনে কিছু দেখানোর দরকার হয় বা তুমি setState করো।

# ৬. didUpdateWidget(): (শর্তসাপেক্ষ) এটি তখনই কল হয় যখন প্যারেন্ট উইজেট থেকে কোনো নতুন ডাটা (Configuration) তোমার উইজেটে আসে। এটি কল হলে ফ্লুটার আবার ৩ নাম্বার থেকে না, বরং সরাসরি ৫ নাম্বার অর্থাৎ build মেথডে চলে যায়।

# ৭. deactivate(): এটি তখনই কল হয় যখন উইজেটটি সাময়িকভাবে ট্রি (Tree) থেকে সরে যায়। (খুব কম কাজে লাগে)।

# ৮. dispose(): এটি হলো চিরবিদায় বা মৃত্যু। এখানে তুমি সব কন্ট্রোলার ক্লোজ করে দাও।
💡 একটি প্রো-চার্ট (তোমার বোঝার সুবিধার্থে):
# ধাপ	নাম	কেন মনে রাখবে?
১	Constructor	উইজেট অবজেক্ট তৈরি।

২	initState	ডেটা লোডিং বা লজিক সেটআপ (একবার)।

৩	didChangeDependencies	থিম বা স্ক্রিন সাইজ রিসিভ করা।

৪	build	UI জেনারেট করা (বারবার)।

৫	didUpdateWidget	প্যারেন্ট থেকে ডাটা আপডেট আসলে।

৬	dispose	মেমোরি খালি করা (শেষবার)।

# কেন এই সিরিয়ালটা মুখস্থ রাখা জরুরি?

ভাই, ধরো তুমি initState-এ একটা টাইমার চালালে, কিন্তু dispose-এ সেটা বন্ধ করলে না। তখন তোমার অ্যাপ ব্যাকগ্রাউন্ডে ব্যাটারি খাবে। আবার ধরো তুমি build মেথডের ভেতর এপিআই কল (API Call) দিয়ে দিলে—তখন প্রতিবার স্ক্রিন রিফ্রেশ হওয়ার সময় এপিআই কল হবে এবং তোমার অ্যাপ ল্যাগ করবে। এই ভুলগুলো এড়ানোর জন্যই এই সিরিয়ালটা জানা মাস্ট!

