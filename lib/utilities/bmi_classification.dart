import 'package:flutter/material.dart';

class BMIClassification {
  final String category;
  final String range;
  final String inference;

  BMIClassification(
      {@required this.category,
      @required this.range,
      @required this.inference});
}