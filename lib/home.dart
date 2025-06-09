import 'package:flutter/material.dart';
import 'result.dart' show Result;
import 'questionbank.dart';

class QuizApp extends StatefulWidget {
  QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> IconsList = [];
  int ? overallmarks;
  questionbank QA = questionbank();
  int Marks = 0;
  void CheckQuiz(bool UserSelectedAnswer) {
    if (QA.FinshQuiz() == true) {
      Checking(UserSelectedAnswer);
      overallmarks=IconsList.length*5;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>Result(sequeredmarks: Marks, totalmarks: overallmarks)));
      QA.QuizClose();
      IconsList = [];
    } else {
      Checking(UserSelectedAnswer);
      QA.NextQuestion();
    }
  }

  void Checking(bool UserSelectedAnswer) {
    if (QA.getanswer() == UserSelectedAnswer) {
      IconsList.add(Icon(Icons.check_circle, size: 50, color: Colors.green));
      Marks = Marks + 5;
    } else {
      IconsList.add(Icon(Icons.cancel, size: 50, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                "$Marks",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QA.getqeustion()!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  // True Button with curved corners
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        CheckQuiz(true);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text("True", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                  // False Button with curved corners
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        CheckQuiz(false);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text("False", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: IconsList,
                    ),
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
