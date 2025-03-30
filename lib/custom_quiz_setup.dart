import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'database.dart';
import 'providers.dart';

class CustomQuizSetupPage extends ConsumerStatefulWidget {
  const CustomQuizSetupPage({super.key});

  @override
  ConsumerState<CustomQuizSetupPage> createState() => _CustomQuizSetupPageState();
}

class _CustomQuizSetupPageState extends ConsumerState<CustomQuizSetupPage> {
  List<String> _subjects = [];
  Set<String> _selectedSubjects = {};
  int _questionCount = 10; // Default value

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    final db = ref.read(databaseProvider);
    final subjects = await db.getSubjects(); // Fetch subjects from DB
    if (mounted) {
      setState(() {
        _subjects = subjects;
      });
    }
  }

  Future<void> _startCustomQuiz() async {
    if (_selectedSubjects.isEmpty) return; // Ensure subjects are selected

    final db = ref.read(databaseProvider);
    final questions = await db.getCustomQuestions(_selectedSubjects.toList(), _questionCount);

    if (questions.isNotEmpty) {
      ref.read(totalQuestionsProvider.notifier).state = _questionCount;
      ref.read(quizQuestionsStateProvider.notifier).state = questions;
    }

    if (mounted) context.go('/quiz'); // Start quiz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B223E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // ✨ Title
                const Text(
                  "Customize Your Quiz",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                // 🟪 Subjects Section (Modern Card Look)
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF35284E),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Subjects",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),

                      const SizedBox(height: 10),

                      if (_subjects.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child: CircularProgressIndicator(color: Colors.white)),
                        )
                      else
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
                          children: _subjects.map((subject) {
                            final isSelected = _selectedSubjects.contains(subject);
                            return ChoiceChip(
                              label: Text(subject),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedSubjects.add(subject);
                                  } else {
                                    _selectedSubjects.remove(subject);
                                  }
                                });
                              },
                              selectedColor: const Color(0xFF7A68FF),
                              backgroundColor: const Color(0xFF4A3A6B),
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔵 Question Count Section (Modern Card Look)
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF35284E),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Number of Questions",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),

                      const SizedBox(height: 10),

                      // 🟣 Modern Slider
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6,
                          thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 20),
                          activeTrackColor: const Color(0xFF7A68FF),
                          inactiveTrackColor: Colors.white30,
                          thumbColor: Colors.white,
                          overlayColor: const Color(0xFF7A68FF).withOpacity(0.3),
                        ),
                        child: Slider(
                          value: _questionCount.toDouble(),
                          min: 10,
                          max: 50,
                          divisions: 8,
                          label: "$_questionCount",
                          onChanged: (value) {
                            setState(() {
                              _questionCount = value.toInt();
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 5),

                      Center(
                        child: Text(
                          "$_questionCount Questions",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🚀 Start Quiz Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A68FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      elevation: 5,
                    ),
                    onPressed: _selectedSubjects.isNotEmpty ? _startCustomQuiz : null,
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
