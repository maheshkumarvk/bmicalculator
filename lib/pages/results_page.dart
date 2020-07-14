import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String resultText;
  final String bmiResult;
  final String bmiRangeText;
  final String bmiRangeResult;
  final String bmiFortuneText;

  const ResultsPage(
      {@required this.resultText,
      @required this.bmiResult,
      @required this.bmiRangeText,
      @required this.bmiRangeResult,
      @required this.bmiFortuneText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: Text(
                  'Your Result',
                  style: kResultTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: ReusableCard(
                  backgroundColor: kActiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          resultText,
                          style: kResultFormalText,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: kBMIResultText,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                        child: Text(bmiRangeText, style: kBMIRangeText),
                      ),
                      Text(bmiRangeResult, style: kBMIFortuneText),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 80.0, 10.0, 0.0),
                        child: Center(
                            child: Text(
                          bmiFortuneText,
                          style: kBMIFortuneText,
                        )),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ReusableCard(
                        cardChild: Center(
                          child: Text(
                            'RE-CALCULATE YOUR BMI',
                            style: kBottomButtonTextStyle,
                          ),
                        ),
                        backgroundColor: kBottomContainerColor))),
          ],
        ));
  }
}
