import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTakeHeight extends StatelessWidget {
  const CustomTakeHeight({super.key, this.onChanged});
  final Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kInactiveCardCoulor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: kLableTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'cm',
                )
              ],
            ),
            Slider(
                activeColor: Color(0xFFEB1555),
                inactiveColor: Color(0xFF8D8E98),
                min: 120,
                max: 220,
                value: height.toDouble(),
                onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
