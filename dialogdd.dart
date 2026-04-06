import 'package:flutter/material.dart';

class Dialogdd extends StatelessWidget {
  const Dialogdd({super.key});



void showAdvancedBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    
    // ১. backgroundColor: বটম শিটের পেছনের রং
    backgroundColor: Colors.white,
    
    // ২. shape: উপরের কোণা গোল করার জন্য
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    
    // ৩. isScrollControlled: true দিলে এটি ফুল স্ক্রিন পর্যন্ত বড় হতে পারবে
    // এটি বিশেষ করে কিবোর্ড ওপেন হলে বা অনেক ডাটা থাকলে ব্যবহার করা হয়
    isScrollControlled: true,
    
    // ৪. isDismissible: false দিলে বাইরে ক্লিক করলে এটি বন্ধ হবে না
    isDismissible: true,
    
    // ৫. enableDrag: false দিলে হাত দিয়ে টেনে নিচে নামানো যাবে না
    enableDrag: true,
    
    // ৬. showDragHandle: উপরে একটি ছোট ধরার হ্যান্ডেল দেখাবে (Flutter 3.10+)
    showDragHandle: true,
    
    // ৭. barrierColor: বটম শিট ওপেন হলে পেছনের স্ক্রিনটি কোন রঙের হবে
    barrierColor: Colors.black.withOpacity(0.6),

    // ৮. builder: এখানে আমরা আমাদের উইজেটটি তৈরি করি
    builder: (BuildContext context) {
      return Padding(
        // কিবোর্ড যেন কন্টেন্ট ঢেকে না ফেলে তার জন্য ইনসেট প্যাডিং
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min, // কন্টেন্ট যতটুকু, শিট ততটুকু বড় হবে
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Advanced Settings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter your update...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.notifications_active, color: Colors.orange),
              title: const Text("Push Notifications"),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Apply Changes", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}


  void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // ডায়ালগের বাইরে ক্লিক করলে বন্ধ হবে কিনা
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // কোণা গোল করার জন্য
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 300, // আপনার প্রয়োজনমতো হাইট দিন
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ১. একটি সুন্দর আইকন বা ইমেজ
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.check, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 20),
              
              // ২. টাইটেল
              const Text(
                "Success!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              // ৩. বর্ণনা
              const Text(
                "Your application has been updated successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              
              // ৪. কাস্টম বাটন
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Awesome!", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  // ডায়ালগ দেখানোর মূল ফাংশন
  void _showLanguageSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            "Select Language",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          children: [
            // অপশন ১: বাংলা
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context); // ডায়ালগ বন্ধ করা
                _handleSelection(context, "Bangla");
              },
              child: const ListTile(
                leading: Icon(Icons.language, color: Colors.green),
                title: Text("Bangla"),
              ),
            ),
            // অপশন ২: ইংলিশ
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _handleSelection(context, "English");
              },
              child: const ListTile(
                leading: Icon(Icons.language, color: Colors.blue),
                title: Text("English"),
              ),
            ),
            // ক্লোজ বাটন
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // সিলেকশন হ্যান্ডেল করার ফাংশন
  void _handleSelection(BuildContext context, String language) {
    // এখানে আপনি ডেটা ডাটাবেজে সেভ করতে পারেন বা স্ন্যাকবার দেখাতে পারেন
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You selected: $language")),
    );
  }

  @override
  Widget build(BuildContext context) {
void showAppAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Lucky & Power App', // আপনার অ্যাপের নাম
      applicationVersion: '1.0.2', // অ্যাপ ভার্সন
      applicationIcon: const FlutterLogo(size: 50), // অ্যাপের লোগো (এখানে লোগো পাথ দিতে পারেন)
      applicationLegalese: '© 2026 Lucky & Power. All rights reserved.', // কপিরাইট টেক্সট
      children: [
        const SizedBox(height: 15),
        const Text(
          "This is an educational application developed to help students learn programming languages like Java, Python, and Flutter.",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

    void simpleDialz(){
      showDialog(
        context: context, 
        builder: (context)=>SimpleDialog(
          title: Text("simple Dialog"),
          children: [
            SimpleDialogOption(
              onPressed: ()=> Navigator.pop(context, 'Bangla'),

            )
          ],

        ));
    }

    void altDialogZ(){

    showDialog(
          context: context,
          builder: (context) => AlertDialog(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 50,
                ),
                title: Text('This is title'),
                content: Text('Are you sure...?'),
                actions: [
                  TextButton(onPressed: () {}, child: Text('yes')),
                  TextButton(onPressed: () {}, child: Text('No')),
                ],
              ));

   }
    return  Scaffold(
      appBar: AppBar(
        title: Text("All Dialog"),

        actions: [
          PopupMenuButton<String>(
  // ১. onSelected: কোনো অপশন সিলেক্ট করলে কী হবে
  onSelected: (String value) {
    print("Selected: $value");
  },

  // ২. itemBuilder: মেনুর ভেতর কী কী অপশন থাকবে তা এখানে ডিফাইন করা হয়
  itemBuilder: (BuildContext context) => [
    const PopupMenuItem<String>(
      value: 'Profile',
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'Settings',
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ),
    const PopupMenuDivider(), // মেনুর মাঝে একটি দাগ বা ডিভাইডার
    const PopupMenuItem<String>(
      value: 'Logout',
      child: ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text('Logout', style: TextStyle(color: Colors.red)),
      ),
    ),
  ],

  // ৩. icon: থ্রি-ডট আইকন পরিবর্তন করতে চাইলে
  icon: const Icon(Icons.more_vert),

  // ৪. tooltip: আইকনের ওপর চেপে ধরলে যে টেক্সট দেখাবে
  tooltip: "Show Menu",

  // ৫. elevation: মেনুর শ্যাডো বা গভীরতা
  elevation: 10,

  // ৬. offset: মেনুটি বাটন থেকে কতটুকু দূরে পপ-আপ হবে
  offset: const Offset(0, 50),

  // ৭. shape: মেনুর বর্ডার রেডিয়াস বা কোণা গোল করা
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),

  // ৮. color: মেনুর ব্যাকগ্রাউন্ড কালার
  color: Colors.white,

  // ৯. enabled: মেনুটি কাজ করবে কি না (True/False)
  enabled: true,
          )
        ],
        ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){altDialogZ();}, child: Text("AlertDialog")),
          ElevatedButton(onPressed: (){_showLanguageSimpleDialog(context);}, child: Text("Simple Dialog"),),
         ElevatedButton.icon(
          onPressed: () => showAppAboutDialog(context),
          icon: const Icon(Icons.info_outline),
          label: const Text("Show App Info"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),

        ElevatedButton(
          onPressed: () => showCustomDialog(context),
          child: const Text("Open Custom Dialog"),
        ),

        ElevatedButton(
  onPressed: () => showAdvancedBottomSheet(context),
  child: const Text("Open Bottom Sheet"),
)
        ],
      ),



      // ২. bottomSheet প্রোপার্টি (Stateless এর জন্য এটিই সেরা)
      bottomSheet: Container(
        // height: কন্টেন্ট অনুযায়ী হাইট হবে
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // backgroundColor: শিটের ব্যাকগ্রাউন্ড কালার
          color: Colors.white,
          // shape: বর্ডার রেডিয়াস বা কোণা গোল করা
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // কন্টেন্ট যতটুকু, শিট ততটুকু জায়গা নিবে
          children: [
            // showdraghandle এর মতো একটি কাস্টম ডিজাইন
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Text("Total Amount", style: TextStyle(color: Colors.grey)),
                      Text("\$450.00", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // এখানে বুকিং বা পেমেন্ট লজিক থাকবে
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Book Now", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );


   
  }
}