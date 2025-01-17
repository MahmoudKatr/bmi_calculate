import 'package:bmi_calculate/bmi_calculate.dart';
import 'package:bmi_calculate/constant.dart';
import 'package:bmi_calculate/widget/custom_gender.dart';
import 'package:bmi_calculate/widget/custom_take_height.dart';
import 'package:bmi_calculate/widget/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/custom_button.dart';
import 'resute_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculations')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(children: [
            CustomGender(
              genderType: Gender.male,
              name: 'male',
              icon: FontAwesomeIcons.mars,
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
            ),
            CustomGender(
              genderType: Gender.female,
              name: 'Female',
              icon: FontAwesomeIcons.venus,
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
            ),
          ])),
          CustomTakeHeight(
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kInactiveCardCoulor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'weight',
                      style: kLableTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kTitleTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kInactiveCardCoulor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Age',
                      style: kLableTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kTitleTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ))
            ],
          ),
          CustomButton(
            name: "CALCULATE",
            click: () {
              BMICalculator calculator = BMICalculator(
                weight: weight.toDouble(),
                height: height.toDouble(),
                gender: selectedGender.name.toString(),
              );
              calculator.calculateBMI();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResuteView(
                        getBMI: calculator.getBMI(),
                        getBMICategory: calculator.category,
                        getGMIAdvice: calculator.advice),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
