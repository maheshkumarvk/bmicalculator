import 'dart:math';

import 'package:bmi_calculator/utilities/bmi_classification.dart';
import 'package:flutter/material.dart';

Map<String, BMIClassification> bmiCategories = {
  'Underweight': BMIClassification(
      category: 'Underweight',
      range: '0 - 18.5 kg/m2',
      inference:
          'Risk of developing problems such as nutritional deficiency and osteoprorosis'),
  'Normal': BMIClassification(
      category: 'Normal',
      range: '18.5 - 23 kg/m2',
      inference: 'You have a normal body weight. Good job!'),
  'Obese1': BMIClassification(
      category: 'Overweight - at risk',
      range: '23 - 25 kg/m2',
      inference: 'Low risk. Get fit to have a normal body weight.'),
  'Obese2': BMIClassification(
      category: 'Overweight - Moderately obese',
      range: '25 - 30 kg/m2',
      inference:
          'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes'),
  'Obese3': BMIClassification(
      category: 'Overweight - Severly obese',
      range: '> 30 kg/m2',
      inference:
          'High risk of developing heart disease, high blood pressure, stroke, diabetes')
};

class BMIMath {
  final int weight;
  final int height;

  double bmi;
  BMIClassification classification = bmiCategories['Normal'];

  BMIMath({@required this.weight, @required this.height});

  String calculateBMI() {
    bmi = weight / pow((height / 100), 2);
    if (bmi <= 18.5) {
      classification = bmiCategories['Underweight'];
    } else if (bmi <= 23.0) {
      classification = bmiCategories['Normal'];
    } else if (bmi <= 25) {
      classification = bmiCategories['Obese1'];
    } else if (bmi <= 30) {
      classification = bmiCategories['Obese2'];
    } else {
      classification = bmiCategories['Obese3'];
    }

    return bmi.toStringAsFixed(1);
  }

  BMIClassification getBMIInference() {
    return classification;
  }
}
