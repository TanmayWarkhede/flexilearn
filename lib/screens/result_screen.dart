import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Congratulatory message
            Text(
              'Congratulations! You have successfully completed the quiz!',
              style: TextStyle(
                fontSize: 20, // Adjust font size as needed
                color: Colors.black, // Text color
                fontWeight: FontWeight.bold, // Make it bold
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            SizedBox(height: 20),
            // Display the score
            Text(
              'Your Score: $score/$total',
              style: TextStyle(
                fontSize: 24, // Increased font size
                color: Colors.black, // Text color
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                backgroundColor: Colors.blueAccent, // Button color
                foregroundColor: Colors.white, // Text color on button
                textStyle:
                    TextStyle(fontSize: 20), // Increased button text size
              ),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
