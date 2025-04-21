import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF149954).withAlpha(180),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),)),
    );
  }
}