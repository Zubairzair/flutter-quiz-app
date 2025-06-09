import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lab7/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => QuizApp()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('images/img1.png'),
                  ),
                  SizedBox(height: 30),

                  // App Relevance Text
                  Text(
                    'Welcome to AI QuizApp!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  // Quotation
                  Text(
                    '"Knowledge is power, quiz is the key!"',
                    style: TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  // Loading Indicator
                  LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.tealAccent,
                    minHeight: 6,
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Loading your quiz, please wait...',
                    style: TextStyle(color: Colors.white70),
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
