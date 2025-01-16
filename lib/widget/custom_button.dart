import 'package:bmi_calculate/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.click, required this.name});
  final void Function() click;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBottomContainerCoulor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
          onPressed: () {
            click();
          },
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
