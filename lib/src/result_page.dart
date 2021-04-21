import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmiapps/src/constants.dart';
import 'package:bmiapps/src/widget/card_widget.dart';
import 'package:bmiapps/src/app.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.resultLabel, this.resultNumber, this.resultInterpretation});

  final String resultLabel;
  final String resultNumber;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR '),
        backgroundColor: backgroundColour,
      ),
      backgroundColor: backgroundColour,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 30.0, top: 30.0),
              child: Text(
                'Your Result BMI',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
                colour: cardColour,
                childChard: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultLabel,
                      style: kResultStyle,
                    ),
                    Text(
                      resultNumber,
                      style: kResultNumberStyle,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        resultInterpretation,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(color: Color(0xFFEB1555)),
            height: bottomHeight,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(10.0),
              color: Color(0xFFEB1555),
              textColor: Colors.white,
              child: Text("Re-Calculate",
                  style: TextStyle(
                      fontSize: 24.0,
                      decoration: TextDecoration.none,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
