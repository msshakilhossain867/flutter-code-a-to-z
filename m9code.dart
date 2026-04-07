import 'package:flutter/material.dart';

class M9code extends StatelessWidget {
  const M9code({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

//       appBar: AppBar(
//         title: Text("M9Code"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         elevation: 8,
//         leading: IconButton(onPressed: (){}, icon: Icon(Icons.contact_emergency)),
//         actions: [
//           Icon(Icons.call),
//           Icon(Icons.broken_image),
      
//         ],

//         automaticallyImplyLeading: false,

//   //      flexibleSpace: Container(
//   //   decoration: BoxDecoration(
//   //     gradient: LinearGradient(
//   //       colors: [Colors.blue, Colors.purple],
//   //       begin: Alignment.topLeft,
//   //       end: Alignment.bottomRight,
//   //     ),
//   //   ),
//   // ),

// //   flexibleSpace: Image(
// //   image: NetworkImage("https://images.pexels.com/photos/35766731/pexels-photo-35766731.jpeg",),

// //   fit: BoxFit.cover,
// // ),


//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20)
//           )
//         ),
//       ),

// animataion appbar ------------------------

// body: CustomScrollView(
//           slivers: [
//             // আপনার কাঙ্ক্ষিত SliverAppBar এখানে
//             SliverAppBar(
//               expandedHeight: 250.0, //AppBar কতটুকু বড় হবে
//               pinned: true,          // স্ক্রল করলেও উপরে আটকে থাকবে
//               backgroundColor: Colors.blueAccent,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 title: const Text(
//                   "এনিমেটেড টাইটেল",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 background: Image.network(
//                   "https://images.pexels.com/photos/35766731/pexels-photo-35766731.jpeg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             // বডির কন্টেন্ট (লিস্ট হিসেবে দেওয়া হলো যাতে স্ক্রল করা যায়)
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => ListTile(
//                   leading: CircleAvatar(child: Text("${index + 1}")),
//                   title: Text("আইটেম নাম্বার ${index + 1}"),
//                   subtitle: const Text("নিচে স্ক্রল করে এনিমেশন দেখুন"),
//                 ),
//                 childCount: 30, // ৩০টি আইটেম জেনারেট হবে
//               ),
//             ),
//           ],
//         ),


body: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  
  reverse: true,
  padding: EdgeInsets.all(20),
  physics: BouncingScrollPhysics(),
  
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.min,

    children: [
      Container(
        
        height: 300,
        width: double.infinity,
        color: Colors.green,
      ),

       Container(
        child: Text("My Love",
        style: TextStyle(
          fontSize: 22,
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          letterSpacing: 10,
          wordSpacing: 10,
          backgroundColor: Colors.blue,
          height: 1.5,
          overflow: TextOverflow.ellipsis,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed,
          decorationThickness: 5,
          decorationColor: Colors.red
        
          
        ),),
        
        height: 300,
        width: double.infinity,
        color: Colors.green,
      ),

       Container(

        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){}
            , child: Text("ElevatedButton"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              shadowColor: Colors.black,
              elevation: 8,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            ),
            SizedBox(height: 10,),

            ElevatedButton.icon(
              onPressed: null,
              label: Icon(Icons.lock),
              style: ElevatedButton.styleFrom(
            
                minimumSize: Size(200, 50),
                fixedSize: Size(200, 56),
               // maximumSize: Size(150, 46)
               side: BorderSide(
                color: Colors.white,
                width: 1.5,
                strokeAlign: BorderSide.strokeAlignCenter,
                
                style: BorderStyle.solid),
                disabledBackgroundColor: Colors.amber,
                surfaceTintColor: Colors.amber,
                
               )
               
              ),
              SizedBox(height: 10,),


              OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(),
                 child: Text("Hello outline")
                ),
                SizedBox(height: 10,),
                TextButton(onPressed: (){}, child: Text("hello shakil"),style: TextButton.styleFrom(),)
              

          ],
        ),
        
        height: 300,
        width: double.infinity,
        color: Colors.green,
      ),

       Container(
        
        height: 300,
        width: double.infinity,
        color: Colors.green,
      ),
    ],



  ),
),
      
    );
  }
}