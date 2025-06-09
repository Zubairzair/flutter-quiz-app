import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final dynamic sequeredmarks;
  final dynamic totalmarks;

  const Result({
    Key? key,
    required this.sequeredmarks,
    required this.totalmarks,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double percentage = 0;
  String selectedImage = '';
  String message = '';

  List<String> custom_img_list = [
    'images/sad.png',
    'images/mid.png',
    'images/happy.png'
  ];

  @override
  void initState() {
    super.initState();

    double Gmarks = widget.sequeredmarks.toDouble();
    double Tmarks = widget.totalmarks.toDouble();
    percentage = (Gmarks / Tmarks) * 100;

    if (percentage <= 50) {
      selectedImage = custom_img_list[0];
      message = "Better luck next time!";
    } else if (percentage < 80) {
      selectedImage = custom_img_list[1];
      message = "Good effort! Keep improving.";
    } else {
      selectedImage = custom_img_list[2];
      message = "Excellent! You're a genius!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Quiz Result'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show Image
            CircleAvatar(
              backgroundImage: AssetImage(selectedImage),
              radius: 60,
            ),
            SizedBox(height: 20),

            // Score Info
            Text(
              "Your Score",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.sequeredmarks}/${widget.totalmarks} Marks",
              style: TextStyle(fontSize: 20, color: Colors.indigo[900]),
            ),
            Text(
              "${percentage.toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 15),

            // Message
            Text(
              message,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Retry
                  },
                  icon: Icon(Icons.refresh),
                  label: Text("Retry"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst); // Exit
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text("Exit"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
