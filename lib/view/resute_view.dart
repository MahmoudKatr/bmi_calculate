import 'package:bmi_calculate/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ResuteView extends StatelessWidget {
  const ResuteView(
      {super.key,
      required this.getBMI,
      required this.getBMICategory,
      required this.getGMIAdvice});
  final String getBMI;
  final String getBMICategory;
  final String getGMIAdvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardCoulor,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Your Result',
            style: kTitleTextStyle,
          ),
          SizedBox(
            height: 300,
            child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: kInactiveCardCoulor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    children: [
                      Text(getBMICategory, style: kResultTextStyle),
                      Text(
                        getBMI,
                        style: kNumberTextStyle,
                      ),
                      Text(
                        getGMIAdvice,
                        style: kBodyTextStyle,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
          ),
          CustomButton(
            name: "RE-CALCULATE",
            click: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
