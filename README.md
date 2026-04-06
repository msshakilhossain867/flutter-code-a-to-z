## Animation master

১. AnimatedCrossFade (দুইটা উইজেটের মাঝে সুইচ করা)

তোমার কোডে তুমি AnimatedOpacity দিয়ে কিছু দেখাচ্ছ বা লুকাচ্ছ। কিন্তু যদি এমন হয় যে একটার বদলে আরেকটা উইজেট আসবে সুন্দর করে মিশে গিয়ে (Fade), তখন এটি সেরা।
~~~~ Dart

AnimatedCrossFade(
  duration: const Duration(seconds: 1),
  firstChild: const FlutterLogo(size: 100), // প্রথম উইজেট
  secondChild: const Icon(Icons.check_circle, size: 100, color: Colors.green), // দ্বিতীয় উইজেট
  crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
)
~~~~

২. AnimatedDefaultTextStyle (লেখার স্টাইল অ্যানিমেশন)

লেখার সাইজ, কালার বা ফন্ট স্টাইল যদি ধীরে ধীরে চেঞ্জ করতে চাও:
~~~~ Dart

AnimatedDefaultTextStyle(
  duration: const Duration(milliseconds: 500),
  style: TextStyle(
    fontSize: selected ? 30 : 15,
    color: selected ? Colors.blue : Colors.red,
    fontWeight: FontWeight.bold,
  ),
  child: const Text("Taufiqur Sabbir"),
)
~~~~

## ৩. Hero Animation (এক পেজ থেকে অন্য পেজে ওড়া)

এটি অ্যানিমেশনের সবথেকে "Cool" জিনিস। এক পেজের ছবি অন্য পেজে গিয়ে বড় হবে।

    সিস্টেম: দুই পেজেই উইজেটটিকে Hero উইজেট দিয়ে মুড়িয়ে দিতে হয় এবং একই tag দিতে হয়।

~~~~ Dart

// Page 1
Hero(tag: 'profile-pic', child: CircleAvatar(...))

// Page 2
Hero(tag: 'profile-pic', child: Image.network(...))
~~~~

# ৪. Explicit Animations (যখন তোমার ফুল কন্ট্রোল দরকার)

এতক্ষণ যা শিখেছ তা অটোমেটিক। কিন্তু যদি চাও অ্যানিমেশন বারবার চলুক (Loop), বা মাঝপথে থামিয়ে দাও, তবে তোমাকে AnimationController শিখতে হবে। এর জন্য StatefulWidget-এ with SingleTickerProviderStateMixin যোগ করতে হয়।
🚀 অ্যানিমেশনের "A to Z" মাস্টার প্রজেক্ট

নিচে এমন একটা কোড দিচ্ছি যেখানে তোমার কোডের আইডিয়া + নতুন কিছু অ্যাডভান্সড ট্রিকস (যেমন Curves, Transform) আছে:
~~~~ Dart

import 'package:flutter/material.dart';

class AnimationMasterClass extends StatefulWidget {
  const AnimationMasterClass({super.key});

  @override
  State<AnimationMasterClass> createState() => _AnimationMasterClassState();
}

class _AnimationMasterClassState extends State<AnimationMasterClass> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Mastery")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // ১. AnimatedPadding: চারপাশের গ্যাপ অ্যানিমেশন করে
              AnimatedPadding(
                padding: EdgeInsets.all(_isExpanded ? 40 : 10),
                duration: const Duration(milliseconds: 500),
                child: const Text("I Love Flutter Animation", style: TextStyle(fontSize: 18)),
              ),

              // ২. AnimatedRotation & AnimatedScale: ঘোরানো এবং বড় করা
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: AnimatedRotation(
                  turns: _isExpanded ? 1 : 0, // এক চক্কর ঘুরবে
                  duration: const Duration(seconds: 1),
                  child: AnimatedScale(
                    scale: _isExpanded ? 1.5 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: 100, width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(_isExpanded ? 50 : 10),
                      ),
                      child: const Icon(Icons.star, color: Colors.white, size: 40),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // ৩. AnimatedPhysicalModel: শ্যাডো (Shadow) অ্যানিমেশন
              AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                shape: BoxShape.rectangle,
                elevation: _isExpanded ? 20 : 0,
                color: Colors.white,
                shadowColor: Colors.black,
                child: const SizedBox(height: 100, width: 200, child: Center(child: Text("Shadow Animation"))),
              ),

              const SizedBox(height: 50),

              // ৪. Curves: অ্যানিমেশনের ধরন (Bounce, Elastic)
              // তোমার AnimatedContainer-এ 'curve' যোগ করলে সেটা প্রিমিয়াম হয়ে যায়
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut, // এখানে ElasticIn, FastOutSlowIn ট্রাই করো
                height: _isExpanded ? 100 : 150,
                width: _isExpanded ? 250 : 150,
                color: _isExpanded ? Colors.orange : Colors.blue,
                alignment: Alignment.center,
                child: const Text("Bounce Animation!", style: TextStyle(color: Colors.white)),
              ),
              
              const SizedBox(height: 30),
              
              ElevatedButton(
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
                child: const Text("Animate All"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
~~~~

# 💡 অ্যানিমেশন মাস্টার হওয়ার ৩টি সিক্রেট টিপস:

    Curve: সব সময় curve: Curves.easeInOut বা Curves.fastOutSlowIn ব্যবহার করার চেষ্টা করবে। এতে অ্যানিমেশনটা একদম রিয়েলিস্টিক মনে হয়।

    Lottie: যদি খুব কমপ্লেক্স অ্যানিমেশন লাগে (যেমন একটা রকেট উড়ে যাচ্ছে), তবে নিজে কোড না করে Lottie প্যাকেজ ব্যবহার করবে। (Json ফাইল দিয়ে চলে)।

    Performance: স্ক্রিনে যদি অনেক বেশি অ্যানিমেশন একসাথে চলে, তবে অ্যাপ ল্যাগ করতে পারে। তাই বুঝে শুনে ব্যবহার করতে হয়।

    চলো তোমার কোডটাকেই পার্ট বাই পার্ট বুঝি:
    
# ১. AnimatedContainer (তোমার কোডের ১ম পার্ট)
~~~~ Dart

AnimatedContainer(
  duration: Duration(milliseconds: 900),
  height: selected ? 100 : 150,
  width: selected ? 100 : 150,
  decoration: BoxDecoration(
      color: selected ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(20)),
),
~~~~

  কাজ: এটা হলো সাধারণ Container-এর জাদুকরী রূপ। সাধারণ কন্টেইনারে setState করলে সাইজ বা কালার হুট করে চেঞ্জ হয় (ঝটকা লাগে), কিন্তু AnimatedContainer-এ দিলে ওই ৯০০ মিলিসেকেন্ড ধরে ধীরে ধীরে সাইজ আর কালার পরিবর্তন হয়।

    কেন ব্যবহার করেছ: তুমি এখানে selected বুলিয়ান দিয়ে সাইজ (১০০ থেকে ১৫০) আর কালার (সবুজ থেকে লাল) কন্ট্রোল করছ।

# ২. AnimatedOpacity (Add to Cart পার্ট)
~~~~ Dart

AnimatedOpacity(
  opacity: showMessage ? 1 : 0,
  duration: Duration(milliseconds: 1000),
  child: Card(child: Text('Added to cart')),
),
~~~~
    কাজ: কোনো উইজেটকে অদৃশ্য (Invisible) থেকে দৃশ্যমান (Visible) করার জন্য এটা সেরা।

    লজিক: opacity: 0 মানে একদম ভ্যানিশ, আর opacity: 1 মানে পুরোপুরি দেখা যাবে। তুমি এটা বাটন ক্লিকের সাথে সিঙ্ক করেছ, যা কার্ডটিকে ধীরে ধীরে স্ক্রিনে ফুটিয়ে তোলে।

# ৩. AnimatedAlign (CircleAvatar পার্ট)
~~~~ Dart

AnimatedAlign(
  alignment: showMessage ? Alignment.topRight : Alignment.centerLeft,
  duration: Duration(milliseconds: 900),
  child: CircleAvatar(...),
),
~~~~
    কাজ: একটা উইজেটকে স্ক্রিনের এক জায়গা থেকে অন্য জায়গায় সরিয়ে নেওয়ার জন্য এটা ব্যবহার হয়।

    লজিক: তুমি showMessage এর ওপর ভিত্তি করে ছবিটাকে বাম থেকে ডানে সরাচ্ছ। এটা দেখতে অনেকটা মেসেঞ্জারের চ্যাট হেডের মতো লাগে।

# ৪. AnimatedPositioned (Stack এর ভেতর লাল বক্স)
~~~~ Dart

AnimatedPositioned(
  duration: Duration(milliseconds: 900),
  bottom: showMessage ? 0 : -120,
  child: Container(height: 120, color: Colors.red...),
)
~~~~

    কাজ: এটা শুধুমাত্র Stack উইজেটের ভেতরে কাজ করে। কোনো উইজেটকে নির্দিষ্ট পিক্সেল মেপে মুভ করানোর জন্য এটি দরকার।

    লজিক: তুমি কি করেছ? যখন showMessage ফলস, তখন বক্সটা স্ক্রিনের নিচে ১২০ পিক্সেল গভীরে লুকিয়ে থাকে (-120)। ট্রু হলে সেটা ০ পিক্সেল অর্থাৎ স্ক্রিনের ওপরে উঠে আসে। এটা দিয়ে সুন্দর Custom Bottom Sheet বানানো যায়।

💡 তোমার এই কোডটাতে যা যা "বাকি" আছে (A to Z হতে যা লাগবে)

তুমি যেহেতু Implicit অ্যানিমেশন বুঝে গেছ, এই ৩টা ছোট প্রপার্টি শিখলে তুমি এই কোড দিয়েই প্রো হয়ে যাবে:

    Curve (অ্যানিমেশনের ধরন):
    তোমার কোডের প্রতিটি অ্যানিমেটেড উইজেটে curve: Curves.bounceOut বা Curves.elasticInOut যোগ করে দাও। দেখবে তোমার সেই লাল বক্স বা সবুজ কন্টেইনারটা ধীরগতির বদলে লাফিয়ে লাফিয়ে (Bounce) মুভ করবে। এটা অ্যাপকে প্রিমিয়াম লুক দেয়।

    onEnd (অ্যানিমেশন শেষ হওয়ার পর কাজ):
    ধরো, তোমার কন্টেইনারটা বড় হওয়া শেষ হলে তুমি একটা মেসেজ দেখাতে চাও। তখন প্রতিটি অ্যানিমেটেড উইজেটে onEnd: () { print("অ্যানিমেশন শেষ!"); } ব্যবহার করতে পারো।

    AnimatedIcon (আইকন অ্যানিমেশন):
    তুমি চাইলে প্লে বাটন থেকে পজ বাটন হওয়ার অ্যানিমেশনটাও যোগ করতে পারো।

# 🛠️ তোমার জন্য একটি কমপ্লিট "অ্যানিমেশন মাস্টার" প্রজেক্ট (সবগুলো একসাথে)

এই কোডটি তোমার আগের কোডের একটি উন্নত সংস্করণ, যেখানে আমি তোমার আইডিয়াগুলোকে আরও স্মুথ করেছি:
~~~~ Dart

import 'package:flutter/material.dart';

class TaufiqAnimationMaster extends StatefulWidget {
  const TaufiqAnimationMaster({super.key});

  @override
  State<TaufiqAnimationMaster> createState() => _TaufiqAnimationMasterState();
}

class _TaufiqAnimationMasterState extends State<TaufiqAnimationMaster> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Taufiq's Animation Lab")),
      body: Stack( // তোমার সেই Positioned অ্যানিমেশনের জন্য স্ট্যাক লাগবেই
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ১. তোমার কন্টেইনার (উইথ কার্ভ)
                GestureDetector(
                  onTap: () => setState(() => _isTapped = !_isTapped),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.elasticOut, // এটা দিলে লাফাবে
                    height: _isTapped ? 120 : 180,
                    width: _isTapped ? 120 : 180,
                    decoration: BoxDecoration(
                      color: _isTapped ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(_isTapped ? 60 : 20), // গোল হয়ে যাবে
                      boxShadow: [
                        if (!_isTapped) BoxShadow(color: Colors.black26, blurRadius: 10)
                      ],
                    ),
                    child: Icon(_isTapped ? Icons.check : Icons.ads_click, color: Colors.white, size: 50),
                  ),
                ),
                
                const SizedBox(height: 30),

                // ২. তোমার ওপাসিটি অ্যানিমেশন (সহজ ও সুন্দর)
                AnimatedOpacity(
                  opacity: _isTapped ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: const Text("সবুজ মানে আপনি সফল!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // ৩. তোমার সেই স্লাইডিং প্যানেল (AnimatedPositioned)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            bottom: _isTapped ? 0 : -100, // নিচ থেকে পপ আপ হবে
            left: 0, right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(child: Text("অ্যানিমেশন প্যানেল ওপেন হয়েছে!", style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _isTapped = !_isTapped),
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
~~~~

ভাই, তোমার কোড আর আমার এই এক্সট্রা টিপসগুলো মিলালে অ্যানিমেশনের "Implicit" পার্ট ১০০% কমপ্লিট!
