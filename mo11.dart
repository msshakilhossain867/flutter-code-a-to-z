import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hate_tamanna/faw/practice.dart';
import 'package:hate_tamanna/widg/city_cart.dart';

class M11code extends StatelessWidget {
  const M11code({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isClicked=false;

    void shoAlertDialog(){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          icon: Icon(Icons.delete,color: Colors.red,size: 50,),
          title: Text("this is t8itle"),
          content: Text("Are your sure..."),
          actions: [
            TextButton(onPressed: (){}, child: Text("yes")),
             TextButton(onPressed: (){}, child: Text("No")),
          ],
        ));
    }

    void showSimpleDialog(){
      showDialog(
        context: context
      , builder: (context)=> SimpleDialog(
        title: Text("This is tittle"),
        children: [
          SimpleDialogOption(
            onPressed: () {
              print("clicked");
            },
            child: Text("English"),
          ),
          SimpleDialogOption(
            onPressed: () {
              print("clicked");
            },
            child: Text("Bangla"),
          ),
          SimpleDialogOption(
            onPressed: () {
              print("clicked");
            },
            child: Text("Urdu"),
          )
          ,SimpleDialogOption(
            onPressed: () {
              print("clicked");
            },
            child: Text("Arabic"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
            children: [
              Text("Enter your age..."),
              TextField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextButton(onPressed: () {}, child: Text('Cancle')),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Submit'))
                      

                ],
              )
            ],
          ),
          )
        ],

      ));
    }

   void showSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item Deleted"),
        action: SnackBarAction(label: "undo", onPressed: (){}),
      )
    );
   }
   
   void showBottomSheet(){

    showModalBottomSheet(
      context: context, 
      builder: (contex)=>Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('Choose option'),
                    ListTile(
                      title: Text('Option-1'),
                    ),
                    ListTile(
                      title: Text('Option-2'),
                    ),
                    ListTile(
                      title: Text('Option-2'),
                    ),
                    ListTile(
                      title: Text('Option-2'),
                    ),
          ],
        ),
      ) );
   }

    return Scaffold(

      appBar: AppBar(
        title: Text("m11code"),

      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              shoAlertDialog();
            }, child: Text("alert Dialog")),

            SizedBox(height: 15,),

             ElevatedButton(onPressed: (){
              showSimpleDialog();
            }, child: Text("Simple Dialog")),

             SizedBox(height: 15,),

             ElevatedButton(onPressed: (){
              showSnackbar();
            }, child: Text("show snackbar")),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet();
                },
                child: Text('Bottom Sheet')),


                Checkbox(value: true, onChanged: (value){
                  _isClicked=!_isClicked;
                }),

                 Checkbox(value: false, onChanged: (value){
              _isClicked = !_isClicked;
            }),


            Row(
              children: [
                Radio(value: 0, groupValue: 1,onChanged: (Value){

                },),
                Text("opton1"),

                Radio(value: 0, groupValue: 1,onChanged: (Value){

                },),
                Text("opton2"),
                
              ],
            )

          ],
        ),

      
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("test");

        },child: Icon(Icons.add),),





      // body: Center(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [

      //         Stack(
      //           children: [
      //             Container(
      //               color: Colors.red,
      //               height: 200,
      //               width: 200,

      //             ),

      //             Positioned(
      //               left: 20,
      //               top: 20,

      //               child: Container(
      //                 color:  Colors.blue,
      //                 height: 150,
      //                 width: 150,
      //               )
      //               ),

      //               Positioned(
      //                 left: 45,
      //                 top: 45, 
      //                 child: Container(
      //                   color: Colors.green,
      //                   height: 100,
      //                   width: 100,
      //                 )
      //                 )
      //           ],
      //         ),


      //         SizedBox(
      //           height: 15.h,
              
      //         ),

      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             children: [
      //               CityCart(img: 'https://media.istockphoto.com/id/1210768445/photo/skyscraper-in-dhaka-metropolitan-area.jpg?s=612x612&w=0&k=20&c=qGFV2qpVXkUNtm8KYT2avrSZwcBcoeM9wIp4LdADgrI=', cityName: 'Dhaka', ratting: '3.8',),
      //             SizedBox(width: 10,),
      //               // CityCard(img: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/4e/60/58/cox-s-bazar-is-a-town.jpg', CityName: 'cox', ratting: '4.8',),
      //               // CityCard(
      //               //   img:
      //               //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtdUhaC5rpDkzKbopf5UF90ccKowzRiYxE8A&s',
      //               //   CityName: 'Sylhet ',
      //               //   ratting: '4.9',
      //               // ),
                  
      //             ],
      //           ),
      //         ),


      //         SizedBox(height: 15,),
      //       Stack(
      //           children: [
      //             Image.network('https://images.unsplash.com/photo-1566073771259-6a8506099945'),
                  
      //             Container(
          
      //               height: 180,
      //               color: Colors.black.withOpacity(0.4),
      //             ),
                  
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Positioned(
      //                   top: 10,
      //                   left: 10,
      //                   child: Container(
          
      //                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //                       color: Colors.green,
      //                     ),
      //                     child: Text('BEST DEAL',
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 20
      //                     ),
      //                     ),
      //                   ),
      //                 ),
                      
      //                 IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
      //               ],
      //             )
      //           ],
      //         ),
              
      //         SizedBox(height: 10,),
              
      //         Stack(
      //           children: [
      //             Image.network('https://images.unsplash.com/photo-1566073771259-6a8506099945'),
                  
      //             Positioned(
      //                 bottom: 20,
      //                 left: 20,
      //                 right: 20,
      //                 child: ElevatedButton(onPressed: (){}, child: Text('Book now')))
      //           ],
      //         ) 
      //       ],
      //     ),
      //   ),
      // ),


      //class one done listview and gritview


      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10
      //     ), 
      //         itemCount: 20,
      //   itemBuilder: (context,index){
      //     return Card(
      //       color: Colors.purple.shade200,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(Icons.phone),
      //           Text("Cash out",style: TextStyle(fontSize: 20.sp),)
      //         ],
      //       ),
      //     );

          

      //   },
    

        
      //   ),


  // body: GridView.count(
  //   crossAxisCount: 2,
  //   crossAxisSpacing: 10,
  //   mainAxisSpacing: 10,
  //   children: [
  //     Container(
  //       color: Colors.red,
  //     ),

  //     Container(
  //       color: Colors.yellow,
  //     ),

  //     Container(
  //       color: Colors.orange,
  //     ),
  //     Container(
  //       color: Colors.green,
  //     )
  //   ],
    
  //   ),



      // body: ListView.builder(
      //   itemCount: 20,
      //   itemBuilder:(context,index){
      //     return Card(
      //       child: ListTile(
      //         title: Text("Md shakil $index"),
      //         subtitle: Text("018654654 $index"),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),

      //       ),
      //     );
          
      //   } ),

      // body: ListView(
      //   children: [
      //     Card(
      //       color: Colors.orange,
      //       child: ListTile(
      //         title: Text("Shakil"),
      //         subtitle: Text("01784546547"),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),

      //     Card(
      //       color: Colors.orange,
      //       child: ListTile(
      //         title: Text("Shakil"),
      //         subtitle: Text("01784546547"),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),

      //     Card(
      //       color: Colors.orange,
      //       child: ListTile(
      //         title: Text("Shakil"),
      //         subtitle: Text("01784546547"),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     ),

      //     Card(
      //       color: Colors.orange,
      //       child: ListTile(
      //         title: Text("Shakil"),
      //         subtitle: Text("01784546547"),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete,color: Colors.red,),
      //       ),
      //     )
      //   ],
      // ),


    );
  }
}
