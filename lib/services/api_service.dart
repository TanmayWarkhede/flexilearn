import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiService {
  final String baseUrl = 'https://the-trivia-api.com/api/questions';

  Future<List<Question>> fetchQuestions(
      String category, String difficulty, int amount) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl?category=$category&difficulty=$difficulty&limit=$amount'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<Question> questions = [];

        for (var item in jsonResponse) {
          List<String> options = [
            item['correctAnswer'],
            ...item['incorrectAnswers'],
          ];
          options.shuffle(); // Shuffle options

          questions.add(Question(
            question: item['question'],
            options: options,
            answer: item['correctAnswer'],
          ));
        }
        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }
}
