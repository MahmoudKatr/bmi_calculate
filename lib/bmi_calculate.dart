import 'dart:math';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final double height; // Height in cm
  final double weight; // Weight in kg
  double _bmi = 0;
  String category = '';
  String advice = '';

  void calculateBMI() {
    if (height <= 0 || weight <= 0) {
      throw ArgumentError('Height and weight must be positive numbers.');
    }

    // Calculate BMI
    _bmi = weight / pow(height / 100, 2);

    // Determine category and advice
    category = _getCategory();
    advice = _getAdvice(category);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String _getCategory() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String _getAdvice(String category) {
    switch (category) {
      case 'Obese':
        return 'You have a significantly higher weight. Consider consulting a healthcare provider and starting a structured weight-loss program.';
      case 'Overweight':
        return 'Your weight is higher than normal. Regular exercise and a balanced diet can help you achieve a healthier weight.';
      case 'Normal':
        return 'You have a normal body weight. Maintain your healthy lifestyle to keep it that way.';
      case 'Underweight':
        return 'You are underweight. Eating nutrient-rich foods and consulting a nutritionist can help you reach a healthier weight.';
      default:
        return 'No advice available.';
    }
  }
}
