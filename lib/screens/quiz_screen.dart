



import 'dart:math';
import 'package:facts_app/data/quiz_data.dart';
import 'package:facts_app/models/quiz_question_model.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> selectedQuestions = [];
  List<String> userAnswers = [];
  List<String> shuffledOptions = []; // NEW
  int currentIndex = 0;
  int score = 0;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    _generateRandomQuestions();
    _shuffleOptions(); // NEW
  }

  void _generateRandomQuestions() {
    final random = Random();
    selectedQuestions = List.from(mcqQuestions)..shuffle(random);
    selectedQuestions = selectedQuestions.take(5).toList();
    userAnswers = [];
  }

  void _shuffleOptions() {
    final currentQuestion = selectedQuestions[currentIndex];
    shuffledOptions = List<String>.from(currentQuestion.options)..shuffle();
  }

  void _checkAnswer(String selectedOption) {
    final currentQuestion = selectedQuestions[currentIndex];
    userAnswers.add(selectedOption);

    if (selectedOption == currentQuestion.correctAnswer) {
      score++;
    }

    if (currentIndex < selectedQuestions.length - 1) {
      setState(() {
        currentIndex++;
        _shuffleOptions(); // NEW
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      score = 0;
      currentIndex = 0;
      showResult = false;
      _generateRandomQuestions();
      _shuffleOptions(); // NEW
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Result')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Your Score: $score / ${selectedQuestions.length}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(selectedQuestions.length, (index) {
                final question = selectedQuestions[index];
                final userAnswer = userAnswers[index];
                final isCorrect = userAnswer == question.correctAnswer;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Q${index + 1}: ${question.question}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Text('Correct Answer: ${question.correctAnswer}',
                            style: const TextStyle(color: Colors.green)),
                        Text('Your Answer: $userAnswer',
                            style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red)),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: _restartQuiz,
                child: const Text(
                  'Play Again',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = selectedQuestions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Fun Quiz'),
        centerTitle: true,
        //backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Card( 
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8,
              shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    children: [
                      Text(
                        'Instructions',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '. Choose the correct answer. \n. Each question has only one correct option in four options below. \n. You will get 5 random questions each time! \n. When user select answer, user will be automatically moves to next question. \n. At the end, user will see the correct answer and their answer for each question.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Question ${currentIndex + 1} / ${selectedQuestions.length}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Q${currentIndex + 1}: ${currentQuestion.question}',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ...shuffledOptions.map((option) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => _checkAnswer(option),
                    child: Text(option),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}