import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/utilities/bmi_math.dart';
import 'package:bmi_calculator/utilities/bmi_classification.dart';
import 'package:bmi_calculator/widgets/gender_icon.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 20;
  BMIClassification bmiClassification;
  BMIMath bmiMath;
  String bmiResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  backgroundColor: gender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderIconWidget(
                    iconData: FontAwesomeIcons.mars,
                    caption: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  cardChild: GenderIconWidget(
                    iconData: FontAwesomeIcons.venus,
                    caption: 'FEMALE',
                  ),
                  backgroundColor: gender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kMeasureTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kSliderThumbColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kSliderActiveTrackColor,
                        overlayColor: kSliderOverlayColor,
                      ),
                      child: Slider(
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                      ),
                    )
                  ],
                ),
                backgroundColor: kActiveCardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  backgroundColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kMeasureTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundedIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  backgroundColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kMeasureTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundedIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bmiMath = BMIMath(weight: weight, height: height);
              bmiResult =  bmiMath.calculateBMI();
              bmiClassification = bmiMath.getBMIInference();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    resultText: bmiClassification.category,
                    bmiResult: bmiResult,
                    bmiRangeText: 'BMI range:',
                    bmiRangeResult: bmiClassification.range,
                    bmiFortuneText: bmiClassification.inference,
                  )));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainterHeight,
              child: Center(
                  child: Text(
                "CALCULATE YOUR BMI",
                style: kBottomButtonTextStyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
