import 'package:flutter/material.dart';
import 'package:riveanimation/models/instructor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(padding: EdgeInsets.only(top: 40, bottom: 10, left: 15),
                child: Text("Instructor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...instructors.map((e) => Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                        height: 200,
                        width: 260,
                        decoration: BoxDecoration(
                          color: e.bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title, style: TextStyle(color:Colors.white, fontWeight:  FontWeight.w600)),
                                Padding(padding: EdgeInsets.only(top: 12, bottom: 8), 
                                child: Text(e.description, style: TextStyle(color: Colors.white70))),
                              ],
                            ))
                          ],
                        ),
                      ),
                    )).toList(),
                  ],
                ),
              ),
               Padding(padding: EdgeInsets.only(top: 40, bottom: 10, left: 15),
                  child: Text("Recent Instructor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                ),

                Container(
                  child: Column(
                      children: [
                      ...instructors.map((e) => Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: e.bgColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.title, style: TextStyle(color:Colors.white, fontWeight:  FontWeight.w600)),
                                  Padding(padding: EdgeInsets.only(top: 12, bottom: 8), 
                                  child: Text(e.description, style: TextStyle(color: Colors.white70))),
                                ],
                              ))
                            ],
                          ),
                        ),
                      )).toList(),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}