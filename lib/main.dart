import 'package:flutter/material.dart';
import 'package:lab7/home.dart';
import 'package:lab7/splash.dart';

void main() {
  runApp(Zair());
}
class Zair extends StatefulWidget {
  const Zair({super.key});

  @override
  State<Zair> createState() => _ZairState();
}

class _ZairState extends State<Zair> {
  @override
  Widget build(BuildContext context) {
    return QuizApp();
  }
}
