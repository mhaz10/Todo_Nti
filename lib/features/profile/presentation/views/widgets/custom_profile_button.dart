import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({super.key, required this.icon, required this.text, this.onTap});

  final String icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8827,
        height: MediaQuery.of(context).size.height * 0.0776,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.04),
                blurRadius: 92,
                offset: const Offset(0, 4),
              ),
            ]
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(text, style: Styles.textStyle16),
            Spacer(),
            SvgPicture.asset(kArrowIcon)
          ],
        ),
      ),
    );
  }
}