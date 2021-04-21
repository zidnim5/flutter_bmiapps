import 'package:flutter/material.dart';
import 'package:bmiapps/src/widget/card_widget.dart';
import 'package:bmiapps/src/widget/card_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmiapps/src/constants.dart';
import 'package:bmiapps/src/bmi_brain.dart';
import 'package:bmiapps/src/result_page.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  int number = 180;
  int weight = 60;
  int age = 20;

  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: backgroundColour,
      ),
      backgroundColor: backgroundColour,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? cardColour
                        : inActiveCardColour,
                    childChard:
                        CardContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                  )),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? cardColour
                              : inActiveCardColour,
                          childChard: CardContent(
                              icon: FontAwesomeIcons.venus, label: 'Female'))),
                ],
              )),
              Expanded(
                  child: ReusableCard(
                colour: cardColour,
                childChard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(number.toString(), style: kNumberTextStyle),
                          Text('cm', style: kSupTextStyle),
                        ],
                      ),
                      Slider(
                        value: number.toDouble(),
                        min: 0,
                        max: 200,
                        label: number.toString(),
                        onChanged: (double value) {
                          setState(() {
                            number = value.round();
                          });
                        },
                      ),
                    ]),
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: cardColour,
                    childChard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "Kg",
                              style: kSupTextStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: cardColour,
                    childChard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: kLabelTextStyle),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              )),
              Container(
                decoration: BoxDecoration(color: Color(0xFFEB1555)),
                width: MediaQuery.of(context).size.width,
                height: bottomHeight,
                child: RaisedButton(
                  onPressed: () {
                    bmiBrain bmi = bmiBrain(weight: weight, height: number);
                    bmi.calculateBmi();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  resultLabel: bmi.getResult(),
                                  resultNumber: bmi.calculateBmi(),
                                  resultInterpretation: bmi.getInterpretation(),
                                )));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xFFEB1555),
                  textColor: Colors.white,
                  child: Text("Calculate",
                      style: TextStyle(
                          fontSize: 24.0,
                          decoration: TextDecoration.none,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      fillColor: Colors.grey[600],
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon, color: Colors.white),
      shape: CircleBorder(),
    );
  }
}
