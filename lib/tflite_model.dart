import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class TFLiteModel {
  late Interpreter _interpreter;
  late List<double> minValues, maxValues;

  TFLiteModel._();

  static Future<TFLiteModel> create() async {
    final model = TFLiteModel._();
    await model._loadModel();
    await model._loadScaler();
    return model;
  }

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/tflite/quiz_model.tflite');
  }

  Future<void> _loadScaler() async {
    String jsonStr = await rootBundle.loadString('assets/tflite/scaler.json');
    Map<String, dynamic> scalerData = json.decode(jsonStr);
    minValues = List<double>.from(scalerData["min"]);
    maxValues = List<double>.from(scalerData["max"]);
  }

  List<double> _scaleInput(List<double> input) {
    List<double> scaledInput = [];
    for (int i = 0; i < input.length; i++) {
      scaledInput.add((input[i] - minValues[i]) / (maxValues[i] - minValues[i]));
    }
    return scaledInput;
  }

 List<int> predictQuizAllocation(List<double> weaknessScores) {
  debugPrint("🔮 Running AI Model for Prediction...");

  List<double> scaledInput = _scaleInput(weaknessScores);
  debugPrint("📊 Scaled Input: $scaledInput");

  var inputBuffer = Float32List.fromList(scaledInput).reshape([1, 5]);
  
  // ✅ Fix: Change output buffer to match [1, 5] shape
var outputBuffer = Float32List(5).reshape([1, 5]);  // ✅ Fix applied

  _interpreter.run(inputBuffer, outputBuffer);

  debugPrint("📤 Raw Model Output: ${outputBuffer[0]}");

  // ✅ Extract first row (removing batch dimension)
List<int> allocatedQuestions = List<int>.from(outputBuffer[0].map((e) => e.round()));

  int total = allocatedQuestions.reduce((a, b) => a + b);
  debugPrint("🧮 Initial Question Allocation: $allocatedQuestions (Total: $total)");

  while (total != 50) {
    int index = allocatedQuestions.indexOf(allocatedQuestions.reduce((a, b) => a > b ? a : b));
    allocatedQuestions[index] += (total < 50) ? 1 : -1;
    total = allocatedQuestions.reduce((a, b) => a + b);
  }

  debugPrint("✅ Final Question Allocation: $allocatedQuestions (Total: $total)");

  return allocatedQuestions;
}

}