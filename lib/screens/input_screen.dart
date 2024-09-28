import 'package:flutter/material.dart';
import 'assessment_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedCategory = 'General Knowledge';
  String selectedDifficulty = 'easy';
  int numberOfQuestions = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Quiz Options')),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content centered
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      dropdownColor:
                          Colors.white, // Dropdown menu background color
                      items: <String>[
                        'General Knowledge',
                        'Science: Gadgets',
                        'Mythology',
                        'Geography',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors
                                      .black)), // Increased font size and black text color
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20), // Space between dropdowns
                    DropdownButton<String>(
                      value: selectedDifficulty,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDifficulty = newValue!;
                        });
                      },
                      dropdownColor:
                          Colors.white, // Dropdown menu background color
                      items: <String>[
                        'easy',
                        'medium',
                        'hard',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors
                                      .black)), // Increased font size and black text color
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20), // Space between dropdowns
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Number of Questions',
                        labelStyle:
                            TextStyle(color: Colors.black), // Label color
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      // Input text color and increased font size
                      onChanged: (value) {
                        setState(() {
                          numberOfQuestions = int.tryParse(value) ??
                              5; // Default to 5 if invalid
                        });
                      },
                    ),
                    SizedBox(height: 20), // Space before button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssessmentScreen(
                              category: selectedCategory,
                              difficulty: selectedDifficulty,
                              number: numberOfQuestions,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        backgroundColor: Colors.blueAccent, // Button color
                        foregroundColor: Colors.white, // Text color on button
                        textStyle: TextStyle(
                            fontSize: 22), // Increased button text size
                      ),
                      child: Text('Start Quiz'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
