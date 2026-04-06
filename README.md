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


১. ব্যাক বাটন পুরোপুরি বন্ধ বা ডিজেবল করা
যদি আপনি চান ইউজার ফোনের ব্যাক বাটন চাপলেও কিচ্ছু হবে না, তবে নিচের মতো PopScope ব্যবহার করুন।

Dart
class RestrictedPage extends StatelessWidget {
  const RestrictedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // এটি false থাকলে ব্যাক বাটন কাজ করবে না
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // এখানে চাইলে ইউজারকে মেসেজ দেখাতে পারেন
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("আপনি এই পেজ থেকে ব্যাকে যেতে পারবেন না!")),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Restricted Page"),
          // অ্যাপবারের ডিফল্ট ব্যাক বাটন সরাতে চাইলে:
          automaticallyImplyLeading: false, 
        ),
        body: const Center(child: Text("ব্যাক বাটন লক করা হয়েছে")),
      ),
    );
  }
}
২. অ্যাপবারের ব্যাক বাটন কাস্টমাইজ করা
আপনি যদি অ্যাপবারের বাম পাশের আইকনটি পরিবর্তন করতে চান বা সেখানে নিজের মতো লজিক দিতে চান (যেমন: পপ-আপ দেখানো), তবে leading প্রোপার্টি ব্যবহার করুন।

Dart
AppBar(
  title: const Text("Custom Back Button"),
  // ডিফল্ট বাটন সরিয়ে নিজের বাটন বসানো
  leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.orange),
    onPressed: () {
      // ব্যাকে যাওয়ার আগে কনফার্মেশন ডায়ালগ
      _showExitDialog(context);
    },
  ),
),
৩. সম্পূর্ণ কোড ফাইল (A to Z)
এই ফাইলে আমি ব্যাক বাটন কন্ট্রোল করার সব উপায় একসাথে দিয়েছি। এটি রান করলে আপনি বুঝতে পারবেন কীভাবে ফোনের হার্ডওয়্যার ব্যাক বাটন এবং অ্যাপবার বাটন কন্ট্রোল করতে হয়।

Dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomBackPage()),
          ),
          child: const Text("Go to Controlled Page"),
        ),
      ),
    );
  }
}

class CustomBackPage extends StatelessWidget {
  const CustomBackPage({super.key});

  // এক্সিট ডায়ালগ ফাংশন
 - void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("নিশ্চিত তো?"),
        content: const Text("আপনি কি সত্যিই ফিরে যেতে চান?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("না")),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // ডায়ালগ বন্ধ
              Navigator.pop(context); // আগের পেজে ফেরত
            },
            child: const Text("হ্যাঁ"),
          ),
        ],
      ),
    );
  }-

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // ফোনের হার্ডওয়্যার ব্যাক বাটন অফ করা
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _showExitDialog(context); // ফোনের ব্যাক বাটন চাপলে ডায়ালগ দেখাবে
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Controlled Page"),
          // ১. leading ব্যবহার করে অ্যাপবার বাটন কাস্টমাইজ
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _showExitDialog(context),
          ),
          // ২. চাইলে automaticallyImplyLeading: false দিয়ে পুরোপুরি মুছে দিতে পারেন
        ),
        body: const Center(
          child: Text("ফোনের বা অ্যাপবারের ব্যাক বাটন চাপলে কনফার্মেশন চাইবে।"),
        ),
      ),
    );
  }
}
কেন এগুলো আপনার অ্যাপে দরকার?
automaticallyImplyLeading: false: অনেক সময় আমরা হোম পেজে বা লগইন পেজে ব্যাক বাটন চাই না, তখন এটি কাজে লাগে।

PopScope: ইউজার যেন ভুল করে ডাটা সেভ না করেই পেজ থেকে বের হয়ে না যায় (যেমন আপনার Lucky & Power এর কোনো ইনপুট ফর্ম), তা নিশ্চিত করতে এটি ব্যবহার করা জরুরি।
