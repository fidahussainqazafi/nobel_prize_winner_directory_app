import 'package:flutter/material.dart';

import '../home_screen.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String awardYear;
  String categoryFullName;
  String category;
  String dateAwarded;
  int prizeAmount;
  int prizeAmountAdjusted;
  String motivation;

  DetailScreen(
      {super.key,
      required this.awardYear,
      required this.category,
      required this.categoryFullName,
      required this.dateAwarded,
      required this.name,
      required this.prizeAmount,
      required this.prizeAmountAdjusted,
      required this.motivation});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title:Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40)
            ),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded,size: 30,),

                ),
                SizedBox(width: 100,),
                Text('Nobel Prize Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
        ),
        automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 50,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30,),

            Expanded(child: SingleChildScrollView(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text('Award Year:' ,style: TextStyle(
                fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),),
                        SizedBox(width: 10,),
                        Text(
                          widget.awardYear,style: TextStyle(fontSize: 20),

                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.category_outlined,color: Colors.blue),
                        SizedBox(width: 10,),
                        Text('Category:', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),),
                        SizedBox(width: 10,),
                        Text(
                          widget.category,style: TextStyle(fontSize: 20),

                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.category,color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('Category Full Name:', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),),
                        SizedBox(width: 10,),
                        Text(
                          widget.categoryFullName,style: TextStyle(fontSize: 14),

                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_rounded,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text('Data Awarded:', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),),
                        SizedBox(width: 10,),
                        Text(
                          widget.dateAwarded,style: TextStyle(fontSize: 20),

                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.currency_exchange,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text('Prize Amount:', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),),
                        SizedBox(width: 10,),
                        Text(
                          widget.prizeAmount.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.currency_exchange,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text('Prize Amount Adjusted:',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),),
                        SizedBox(width: 10,),
                        Text(
                          widget.prizeAmountAdjusted.toString(),
                          style: TextStyle(fontSize: 20),

                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.mail_outlined,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text(
                          "Motivation for award:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),

                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.motivation,style: TextStyle(fontSize: 18),

                      ),
                    ),

                  ],
                ),
              ),
            ))
          ],
        ),
      );

  }
}
