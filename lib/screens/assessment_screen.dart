import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/api_service.dart';
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  final String category;
  final String difficulty;
  final int number;

  AssessmentScreen(
      {required this.category, required this.difficulty, required this.number});

  @override
  _AssessmentScreenState createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final ApiService apiService = ApiService();
  List<Question>? questions;
  int questionIndex = 0;
  int score = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      questions = await apiService.fetchQuestions(
          widget.category, widget.difficulty, widget.number);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Failed to load questions: $e');
    }
  }

  void answerQuestion(String selectedOption) {
    if (selectedOption == questions![questionIndex].answer) {
      score++;
    }

    setState(() {
      if (questionIndex < questions!.length - 1) {
        questionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultScreen(score: score, total: questions!.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'), // Add your purple background image here
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              questions![questionIndex].question,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white), // Increased font size and color
            ),
            SizedBox(height: 20),
            ...questions![questionIndex].options.map((option) {
              return ElevatedButton(
                onPressed: () => answerQuestion(option),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20), // Text color on button
                  textStyle:
                      TextStyle(fontSize: 20), // Increased button text size
                ),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
