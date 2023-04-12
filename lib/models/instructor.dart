import 'package:flutter/material.dart';

class Instructor{
  final String title, description, iconSrc;
  final Color bgColor;

  Instructor({required this.title, this.description = "Build animate flutter app from scratch", this.iconSrc = "assets/icons/2.jpg", this.bgColor = const Color(0xff7553F6)});

}

List<Instructor> instructors = [
  Instructor(title: "Flutter animation app"),
  Instructor(title: "Devhubspot Flutter tutorial", bgColor:Colors.blueAccent),
  Instructor(title: "Devhubspot Flutter rive animation", bgColor:Colors.deepPurpleAccent),
  Instructor(title: "Devhubspot Flutter animation", bgColor:Colors.pinkAccent),
];