import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers.dart';

class DetailedScorePage extends ConsumerWidget {
  const DetailedScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectPerformance = ref.watch(subjectPerformanceProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Match theme
      body: Column(
        children: [
          const SizedBox(height: 40), // Space for back button

          // ✅ Custom Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () => context.go('/score'),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ✅ Title
          const Text(
            "Subject-wise Performance",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // ✅ No Data Message
          if (subjectPerformance.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  "No performance data available",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: subjectPerformance.length,
                itemBuilder: (context, index) {
                  final subject = subjectPerformance.keys.elementAt(index);
                  final correct = subjectPerformance[subject]?.correct ?? 0;
                  final total = subjectPerformance[subject]?.total ?? 1;
                  final double percentage = (correct / total) * 100;

                  // ✅ Dynamic Colors Based on Performance
                  Color progressColor = percentage >= 70
                      ? Colors.greenAccent
                      : (percentage >= 40 ? Colors.orangeAccent : Colors.redAccent);

                  return Card(
                    elevation: 5,
                    color: const Color(0xFF35284E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: progressColor,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Subject Name
                          Text(
                            subject,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // ✅ Performance Text
                          Text(
                            "Correct: $correct / $total  (${percentage.toStringAsFixed(1)}%)",
                            style: const TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          const SizedBox(height: 8),

                          // ✅ Progress Bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: percentage / 100,
                              backgroundColor: Colors.white24,
                              color: progressColor,
                              minHeight: 10,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // ✅ Performance Indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                percentage >= 70
                                    ? Icons.star
                                    : (percentage >= 40 ? Icons.trending_up : Icons.warning),
                                color: progressColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                percentage >= 70
                                    ? "Great job!"
                                    : (percentage >= 40 ? "Keep improving!" : "Needs work"),
                                style: TextStyle(
                                  color: progressColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
