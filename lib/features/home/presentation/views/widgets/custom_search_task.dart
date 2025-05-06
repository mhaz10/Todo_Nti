import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/constants.dart';

class CustomSearchTask extends StatelessWidget {
  const CustomSearchTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.055,
        child: TextField(
          cursorColor: Color(0xFFB7B7B7),
          onChanged: (value) {
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: const TextStyle(
              color: Color(0xFFB7B7B7),
              fontSize: 14,
            ),
            suffixIcon: SvgPicture.asset(kSearchTaskIcon, width: 4, height: 4, fit: BoxFit.none,),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ));
  }
}