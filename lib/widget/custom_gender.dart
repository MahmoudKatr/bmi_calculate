import 'package:flutter/material.dart';
import '../constant.dart'; // Import the constants file

class CustomGender extends StatefulWidget {
  const CustomGender({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
    required this.genderType, // Gender type (male or female)
  });

  final String name;
  final IconData icon;
  final VoidCallback onTap;
  final Gender genderType; // Gender type parameter

  @override
  _CustomGenderState createState() => _CustomGenderState();
}

class _CustomGenderState extends State<CustomGender> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Update the global selected gender
            selectedGender = widget.genderType;
          });
          widget.onTap();
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: selectedGender == widget.genderType
                ? kActiveCardCoulor // Active color when selected
                : kInactiveCardCoulor, // Inactive color when not selected
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 80,
              ),
              Text(
                widget.name,
                style: kLableTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
