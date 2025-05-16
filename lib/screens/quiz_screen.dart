// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:facts_app/data/facts_data.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int currentQuestion = 0;
//   int score = 0;
//   bool showResult = false;

//   final List<Map<String, dynamic>> quizData = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateQuiz();
//   }

//   void _generateQuiz() {
//     final random = Random();
//     for (int i = 0; i < 5; i++) {
//       final fact = allFacts[random.nextInt(allFacts.length)];
//       final isFake = random.nextBool(); // randomly decide if we fake it

//       quizData.add({
//         'text': isFake ? '${fact.text} (Fake)' : fact.text,
//         'isTrue': !isFake,
//       });
//     }
//   }

//   void _checkAnswer(bool userAnswer) {
//     if (quizData[currentQuestion]['isTrue'] == userAnswer) {
//       score++;
//     }

//     if (currentQuestion < quizData.length - 1) {
//       setState(() => currentQuestion++);
//     } else {
//       setState(() => showResult = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Quiz Result')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Your Score: $score / ${quizData.length}',
//                   style: const TextStyle(fontSize: 24)),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     currentQuestion = 0;
//                     score = 0;
//                     showResult = false;
//                     quizData.clear();
//                     _generateQuiz();
//                   });
//                 },
//                 child: const Text('Play Again'),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('True or False Quiz')),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Q${currentQuestion + 1}: ${quizData[currentQuestion]['text']}',
//               style: const TextStyle(fontSize: 20),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () => _checkAnswer(true),
//               child: const Text('True'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _checkAnswer(false),
//               child: const Text('False'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:facts_app/data/facts_data.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int currentQuestion = 0;
//   int score = 0;
//   bool showResult = false;

//   final List<Map<String, dynamic>> quizData = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateQuiz();
//   }

//   void _generateQuiz() {
//     final random = Random();
//     final Set<int> usedIndices = {};
//     while (quizData.length < 5) {
//       final index = random.nextInt(allFacts.length);
//       if (!usedIndices.contains(index)) {
//         usedIndices.add(index);
//         final fact = allFacts[index];
//         final isFake = random.nextBool();

//         quizData.add({
//           'text': isFake ? '${fact.text} (Fake)' : fact.text,
//           'isTrue': !isFake,
//         });
//       }
//     }
//   }

//   void _checkAnswer(bool userAnswer) {
//     if (quizData[currentQuestion]['isTrue'] == userAnswer) {
//       score++;
//     }

//     if (currentQuestion < quizData.length - 1) {
//       setState(() => currentQuestion++);
//     } else {
//       setState(() => showResult = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Quiz Result')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Your Score: $score / ${quizData.length}',
//                   style: const TextStyle(fontSize: 24)),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     currentQuestion = 0;
//                     score = 0;
//                     showResult = false;
//                     quizData.clear();
//                     _generateQuiz();
//                   });
//                 },
//                 child: const Text('Play Again'),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('True or False Quiz')),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             const Text(
//               'Quiz Rules:\n- Read the fact.\n- Choose whether it is True or False.\n- No category, facts are random.\n- Score will be shown at the end.',
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text(
//                   'Q${currentQuestion + 1}: ${quizData[currentQuestion]['text']}',
//                   style: const TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _checkAnswer(true),
//                   style: ElevatedButton.styleFrom(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                   ),
//                   child: const Text('True'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _checkAnswer(false),
//                   style: ElevatedButton.styleFrom(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                   ),
//                   child: const Text('False'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:facts_app/data/facts_data.dart'; // Make sure allFacts is imported from your app

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   final Random _random = Random();
//   List<Map<String, dynamic>> quizQuestions = [];
//   int currentQuestion = 0;
//   int score = 0;
//   bool showResult = false;

//   @override
//   void initState() {
//     super.initState();
//     _generateQuiz();
//   }

//   void _generateQuiz() {
//     final Set<int> usedIndexes = {};
//     quizQuestions.clear();

//     while (quizQuestions.length < 5 && usedIndexes.length < allFacts.length) {
//       int correctIndex = _random.nextInt(allFacts.length);
//       if (usedIndexes.contains(correctIndex)) continue;
//       usedIndexes.add(correctIndex);

//       final correctFact = allFacts[correctIndex].text;

//       // Generate 3 wrong options
//       Set<String> options = {correctFact};
//       while (options.length < 4) {
//         final wrongFact = allFacts[_random.nextInt(allFacts.length)].text;
//         options.add(wrongFact);
//       }

//       final shuffledOptions = options.toList()..shuffle();

//       quizQuestions.add({
//         'question': correctFact,
//         'options': shuffledOptions,
//         'answer': correctFact,
//       });
//     }
//   }

//   void _checkAnswer(String selected) {
//     if (quizQuestions[currentQuestion]['answer'] == selected) {
//       score++;
//     }

//     if (currentQuestion < quizQuestions.length - 1) {
//       setState(() => currentQuestion++);
//     } else {
//       setState(() => showResult = true);
//     }
//   }

//   void _restartQuiz() {
//     setState(() {
//       currentQuestion = 0;
//       score = 0;
//       showResult = false;
//       _generateQuiz();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Quiz Result')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Your Score: $score / ${quizQuestions.length}',
//                   style: const TextStyle(fontSize: 24)),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _restartQuiz,
//                 child: const Text('Play Again'),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     final current = quizQuestions[currentQuestion];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Fact Quiz (MCQs)')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Instructions: Select the correct fact from the 4 options. You will get 5 random questions each time!',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               elevation: 4,
//               color: Colors.deepPurple.shade50,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   'Q${currentQuestion + 1}: Which of the following is TRUE?',
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ...current['options'].map<Widget>((option) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: ElevatedButton(
//                   onPressed: () => _checkAnswer(option),
//                   child: Text(option, textAlign: TextAlign.center),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.black87,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: const BorderSide(color: Colors.deepPurple),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:math';
// import 'package:facts_app/data/quiz_data.dart';
// import 'package:facts_app/models/quiz_question_model.dart';
// import 'package:flutter/material.dart';
// //import '../data/mcq_questions_data.dart';
// //import '../models/quiz_question.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   List<QuizQuestion> selectedQuestions = [];
//   int currentIndex = 0;
//   int score = 0;
//   bool showResult = false;

//   @override
//   void initState() {
//     super.initState();
//     _generateRandomQuestions();
//   }

//   void _generateRandomQuestions() {
//     final random = Random();
//     selectedQuestions = List.from(mcqQuestions)..shuffle(random);
//     selectedQuestions = selectedQuestions.take(5).toList(); // Pick 5 random
//   }

//   void _checkAnswer(String selectedOption) {
//     final currentQuestion = selectedQuestions[currentIndex];
//     if (selectedOption == currentQuestion.correctAnswer) {
//       score++;
//     }

//     if (currentIndex < selectedQuestions.length - 1) {
//       setState(() {
//         currentIndex++;
//       });
//     } else {
//       setState(() {
//         showResult = true;
//       });
//     }
//   }

//   void _restartQuiz() {
//     setState(() {
//       score = 0;
//       currentIndex = 0;
//       showResult = false;
//       _generateRandomQuestions();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Quiz Result')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Your Score: $score / ${selectedQuestions.length}',
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                 onPressed: _restartQuiz,
//                 child: const Text('Play Again',style: TextStyle(fontSize: 16,color: Colors.black,),),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     final currentQuestion = selectedQuestions[currentIndex];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Quiz'),
//       centerTitle: true,
//       backgroundColor: const Color.fromRGBO(245, 242, 242, 1),),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             Container(padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(color: Colors.red,
//             //border: Border.all(),
//             borderRadius: BorderRadius.circular(20)),
//             child:  const Column(
//               children: [
//                 Text('Instructions',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
//                 ),
//                   Text(
//               '. Choose the correct answer \n. Each question has only one correct option \n. You will get 5 random questions each time!',
//               style: TextStyle(fontSize: 18),
//               //textAlign: TextAlign.center,
//             ),
//               ],
//             ),
//             //SizedBox(height: 15),
           
            
//             ),
           
//             const SizedBox(height: 20),
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               elevation: 10,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Q${currentIndex + 1}: ${currentQuestion.question}',
//                   style: const TextStyle(fontSize: 18),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ...currentQuestion.options.map((option) {
//               return Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: ElevatedButton(
//                   onPressed: () => _checkAnswer(option),
//                   child: Text(option),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:math';
// import 'package:facts_app/data/quiz_data.dart';
// import 'package:facts_app/models/quiz_question_model.dart';
// import 'package:flutter/material.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   List<QuizQuestion> selectedQuestions = [];
//   int currentIndex = 0;
//   int score = 0;
//   bool showResult = false;

//   @override
//   void initState() {
//     super.initState();
//     _generateRandomQuestions();
//   }

//   void _generateRandomQuestions() {
//     final random = Random();
//     selectedQuestions = List.from(mcqQuestions)..shuffle(random);
//     selectedQuestions = selectedQuestions.take(5).toList(); // Pick 5 random
//   }

//   void _checkAnswer(String selectedOption) {
//     final currentQuestion = selectedQuestions[currentIndex];
//     if (selectedOption == currentQuestion.correctAnswer) {
//       score++;
//     }

//     if (currentIndex < selectedQuestions.length - 1) {
//       setState(() {
//         currentIndex++;
//       });
//     } else {
//       setState(() {
//         showResult = true;
//       });
//     }
//   }

//   void _restartQuiz() {
//     setState(() {
//       score = 0;
//       currentIndex = 0;
//       showResult = false;
//       _generateRandomQuestions();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Quiz Result')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Your Score: $score / ${selectedQuestions.length}',
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Correct Answers: $score',
//                 style: const TextStyle(fontSize: 18, color: Colors.green),
//               ),
//               Text(
//                 'Incorrect Answers: ${selectedQuestions.length - score}',
//                 style: const TextStyle(fontSize: 18, color: Colors.red),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                 onPressed: _restartQuiz,
//                 child: const Text(
//                   'Play Again',
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     }

//     final currentQuestion = selectedQuestions[currentIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz'),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Column(
//                   children: [
//                     Text(
//                       'Instructions',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '. Choose the correct answer \n. Each question has only one correct option \n. You will get 5 random questions each time!',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
        
//               // Question progress
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Question ${currentIndex + 1} / ${selectedQuestions.length}',
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               const SizedBox(height: 10),
        
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 elevation: 10,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'Q${currentIndex + 1}: ${currentQuestion.question}',
//                     style: const TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ...currentQuestion.options.map((option) {
//                 return Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   child: ElevatedButton(
//                     onPressed: () => _checkAnswer(option),
//                     child: Text(option),
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'dart:math';
// import 'package:facts_app/data/quiz_data.dart';
// import 'package:facts_app/models/quiz_question_model.dart';
// import 'package:flutter/material.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   List<QuizQuestion> selectedQuestions = [];
//   List<String> userAnswers = [];
//   int currentIndex = 0;
//   int score = 0;
//   bool showResult = false;

//   @override
//   void initState() {
//     super.initState();
//     _generateRandomQuestions();
//   }

//   void _generateRandomQuestions() {
//     final random = Random();
//     selectedQuestions = List.from(mcqQuestions)..shuffle(random);
//     selectedQuestions = selectedQuestions.take(5).toList();
//     userAnswers = [];
//   }

//   void _checkAnswer(String selectedOption) {
//     final currentQuestion = selectedQuestions[currentIndex];
//     userAnswers.add(selectedOption);

//     if (selectedOption == currentQuestion.correctAnswer) {
//       score++;
//     }

//     if (currentIndex < selectedQuestions.length - 1) {
//       setState(() {
//         currentIndex++;
//       });
//     } else {
//       setState(() {
//         showResult = true;
//       });
//     }
//   }

//   void _restartQuiz() {
//     setState(() {
//       score = 0;
//       currentIndex = 0;
//       showResult = false;
//       _generateRandomQuestions();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showResult) {
//   return Scaffold(
//     appBar: AppBar(title: const Text('Quiz Result')),
//     body: SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//        // mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Center(
//             child: Text(
//               'Your Score: $score / ${selectedQuestions.length}',
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ...List.generate(selectedQuestions.length, (index) {
//             final question = selectedQuestions[index];
//             final userAnswer = userAnswers[index];
//             final isCorrect = userAnswer == question.correctAnswer;

//             return Card(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Q${index + 1}: ${question.question}',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     const SizedBox(height: 6),
//                     Text('Correct Answer: ${question.correctAnswer}',
//                         style: const TextStyle(color: Colors.green)),
//                     Text('Your Answer: $userAnswer',
//                         style: TextStyle(
//                             color: isCorrect ? Colors.green : Colors.red)),
//                   ],
//                 ),
//               ),
//             );
//           }),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//             onPressed: _restartQuiz,
//             child: const Text(
//               'Play Again',
//               style: TextStyle(fontSize: 16, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//     final currentQuestion = selectedQuestions[currentIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz'),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: const Column(
//                   children: [
//                     Text(
//                       'Instructions',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '. Choose the correct answer \n. Each question has only one correct option \n. You will get 5 random questions each time! \n. When user selects answer, user be automatically moves to next question ' ,
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Question ${currentIndex + 1} / ${selectedQuestions.length}',
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 elevation: 10,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'Q${currentIndex + 1}: ${currentQuestion.question}',
//                     style: const TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ...currentQuestion.options.map((option) {
//                 return Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   child: ElevatedButton(
//                     onPressed: () => _checkAnswer(option),
//                     child: Text(option),
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



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