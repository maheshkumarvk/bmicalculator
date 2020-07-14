import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';


class GenderIconWidget extends StatelessWidget {
  GenderIconWidget({@required this.iconData, @required this.caption});
  final IconData iconData;
  final String caption;

  @override
  Widget build(Object context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 80.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(caption, style: kLabelTextStyle),
        ]);
  }
}
