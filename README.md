

# BottomNavigation

# ১. NavigationBar vs BottomNavigationBar

    NavigationBar: এটা দেখতে বেশি সুন্দর, এতে সিলেক্ট করলে একটি Indicator (রঙিন গোল্লা বা বক্স) আসে যা আপনার কোডে indicatorColor দিয়ে কন্ট্রোল করা হয়েছে।

    OnDestinationSelected: পুরনোটাতে ছিল onTap, আর এখানে নাম হলো onDestinationSelected—কাজ একই, শুধু নাম আধুনিক।

# ২. NavigationBarTheme (বস লেভেল ডিজাইন)

আপনি সরাসরি NavigationBar-এর ভেতর ডিজাইন না করে NavigationBarTheme ব্যবহার করেছেন। এটা খুব স্মার্ট পদ্ধতি!

    MaterialStateProperty: এই জিনিসটা নেটিভ অ্যান্ড্রয়েডের ColorStateList-এর মতো কাজ করে। অর্থাৎ, "যখন সিলেক্ট হবে তখন এক কালার, যখন হবে না তখন অন্য কালার"—এই লজিকটা এর মাধ্যমেই দেওয়া হয়।

    resolveWith: এই ফাংশনটা চেক করে যে উইজেটটা এখন কোন অবস্থায় আছে (selected নাকি disabled) এবং সেই অনুযায়ী ডিজাইন রিটার্ন করে।

# ৩. গ্রাডিয়েন্ট ব্যাকগ্রাউন্ড (Pro Trick)

আপনি NavigationBar-কে একটি Container-এর ভেতর ঢুকিয়ে Gradient দিয়েছেন। এটি করার জন্য backgroundColor: Colors.transparent ব্যবহার করা হয়েছে—এটি একটি দারুণ ট্রিক! এতে অ্যাপের লুক প্রিমিয়াম হয়ে যায়।
🛠️ আপনার কোডটাকে আরও একটু নিখুঁত (A to Z) করতে এই ৩টি জিনিস জেনে রাখুন:

# ১. labelBehavior (লেখার প্রদর্শন):
অনেক সময় আমরা চাই শুধু সিলেক্টেড আইটেমের লেখা দেখাবে অথবা কারোরই লেখা দেখাবে না। তখন এটি ব্যবহার করবেন:
Dart

NavigationBar(
  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, // শুধু সিলেক্টেডটার লেখা দেখাবে
  // বাকি কোড...
)

# ২. elevation:
আপনি যদি চান আপনার নেভিগেশন বারটি পেজের ওপর একটু ভাসা ভাসা থাকুক, তবে elevation ব্যবহার করতে পারেন। তবে ট্রান্সপারেন্ট ব্যাকগ্রাউন্ডের ক্ষেত্রে এটি খুব একটা প্রয়োজন হয় না।

# ৩. IndexedStack (ডাটা সেভ রাখা):
আপনার কোডে বর্তমানে যখন আপনি এক পেজ থেকে অন্য পেজে যাবেন, তখন আগের পেজের ডাটা রিসেট হয়ে যেতে পারে। এটা ঠিক করতে আপনার body অংশটুকু এভাবে লিখুন:
~~~~ Dart

body: IndexedStack(
  index: _selecteIndex,
  children: _pages,
),
~~~~

💡 আপনার জন্য প্রো-টিপ:

~~~Dart
import 'package:flutter/material.dart';
import 'package:flutter_15/module_11/GridV.dart';
import 'package:flutter_15/module_11/class_1.dart';
import 'package:flutter_15/module_11/class_2.dart';
import 'package:flutter_15/module_11/class_3.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selecteIndex = 0;

  List _pages = [
    Module11Class2(),
    Gridv(),
    Module11class1(),
    Alert(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_selecteIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade300,
            Colors.purple.shade300
          ])
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade300,
            labelTextStyle: MaterialStateProperty.resolveWith(
                (state){
                  if(state.contains(MaterialState.selected)){
                    return TextStyle(color: Colors.blue,fontSize: 20);

                  }else{
                    return TextStyle(color: Colors.black);

                  }
                }
            ),


            iconTheme: MaterialStateProperty.resolveWith(
                    (state){
                  if(state.contains(MaterialState.selected)){
                    return IconThemeData(color: Colors.white,size: 20);

                  }else{
                    return IconThemeData(color: Colors.black54);

                  }
                }
            ),

          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,

            selectedIndex: _selecteIndex,

              onDestinationSelected: (int index){

          setState((){
            _selecteIndex = index;
          });

              },

              destinations: [

                NavigationDestination(icon: Icon(Icons.home_filled
                ), label: 'Home'),

                NavigationDestination(icon: Icon(Icons.message_rounded
                ), label: 'Inbox'),

                NavigationDestination(icon: Icon(Icons.person
                ), label: 'Profile'),

                NavigationDestination(icon: Icon(Icons.settings
                ), label: 'Setting'),



              ]


          ),
        ),
      ),
    );
  }
} amar instructor eivabea shikaice
~~~~

আপনার ইনস্ট্রাক্টর যে MaterialState ব্যবহার করেছেন, সেটার নতুন নাম ফ্লাটারে এখন WidgetState। কাজ একদম এক, শুধু নাম বদলেছে।

নিচে আপনার শেখা NavigationBar ব্যবহার করেই একটা প্রিমিয়াম এবং স্টাইলিশ কোড দিচ্ছি:
~~~~ Dart

import 'package:flutter/material.dart';

class StylishBottomNav extends StatefulWidget {
  const StylishBottomNav({super.key});

  @override
  State<StylishBottomNav> createState() => _StylishBottomNavState();
}

class _StylishBottomNavState extends State<StylishBottomNav> {
  int _selectedIndex = 0;

  // আপনার পেজগুলো এখানে থাকবে
  final List<Widget> _pages = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Inbox Screen")),
    const Center(child: Text("Profile Screen")),
    const Center(child: Text("Settings Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ১. বডিতে IndexedStack ব্যবহার করা ভালো যাতে পেজ সুইচ করলে ডাটা না হারায়
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      // ২. স্টাইলিশ করার জন্য আমরা নিচে একটু প্যাডিং দিয়ে Floating লুক দেব
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20), // দুই পাশে আর নিচে গ্যাপ
        child: Container(
          decoration: BoxDecoration(
            // ৩. সুন্দর শ্যাডো (Shadow)
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            // ৪. কোনাগুলো গোল (Rounded Corners)
            borderRadius: BorderRadius.circular(30),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Colors.blue.shade100, // সিলেক্ট করলে যে গোল্লা আসে
                labelTextStyle: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue);
                  }
                  return const TextStyle(fontSize: 12, color: Colors.grey);
                }),
                iconTheme: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const IconThemeData(size: 28, color: Colors.blue);
                  }
                  return const IconThemeData(size: 24, color: Colors.grey);
                }),
              ),
              child: NavigationBar(
                height: 70, // বার এর উচ্চতা একটু কমিয়ে স্মার্ট করা
                backgroundColor: Colors.white, // ব্যাকগ্রাউন্ড সাদা রাখলে শ্যাডো ফুটে ওঠে
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                // ৫. লেখা কখন দেখাবে সেটার কন্ট্রোল
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.chat_bubble_outline),
                    selectedIcon: Icon(Icons.chat_bubble_rounded),
                    label: 'Chat',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person_rounded),
                    label: 'Profile',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Icon(Icons.settings_rounded),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
~~~~

# 🔥 এই কোডে "Stylish" কী কী আছে?

    Floating Look: Padding ব্যবহার করে আমরা বারটাকে স্ক্রিনের একদম নিচ থেকে একটু উপরে তুলে দিয়েছি।

    ClipRRect: এটি ব্যবহার করে আমরা বার এর কোনাগুলো 30 রেডিয়াসে গোল করেছি, যা এখনকার প্রিমিয়াম অ্যাপগুলোতে (যেমন Instagram বা Airbnb) দেখা যায়।

    Shadow: BoxShadow দেওয়ার কারণে বারটা স্ক্রিনের ওপর ভেসে আছে বলে মনে হয়।

    Label Behavior: আমরা onlyShowSelected ব্যবহার করেছি। এতে করে যে আইকনটা সিলেক্ট হবে শুধু সেটার নাম দেখাবে, বাকিগুলো ক্লিন থাকবে।

    WidgetState: আপনার ইনস্ট্রাক্টর MaterialState শিখিয়েছেন, আমি এখানে লেটেস্ট WidgetState লিখেছি (ফ্লাটারের নতুন ভার্সনে এটাই স্ট্যান্ডার্ড)।

# 💡 আপনার জন্য একটা বোনাস টিপ:

যদি আরও বেশি স্টাইলিশ বা এনিমেটেড বটম বার চান, তবে আপনি google_nav_bar বা curved_navigation_bar নামে দুইটা খুব জনপ্রিয় প্যাকেজ ব্যবহার করতে পারেন। তবে ইন্টারভিউ বা প্রফেশনাল প্রজেক্টে আপনার ইনস্ট্রাক্টরের দেখানো এই স্ট্যান্ডার্ড পদ্ধতিটাই সেরা।

# old topic 
