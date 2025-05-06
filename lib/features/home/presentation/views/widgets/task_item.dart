import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      width: MediaQuery.of(context).size.width * 0.8906,
      height: MediaQuery.of(context).size.height * 0.1108,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1796,
            width: MediaQuery.of(context).size.width * 0.1796,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(kLoginImage),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(64),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ]
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Go to supermarket to buy some milk & eggs', style: Styles.textStyle14),
                const SizedBox(height: 4,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFCEEBDC),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text('In Progress', style: Styles.textStyle12),
                      ),
                      SvgPicture.asset(kHomeIcon, width: 5, height: 5,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}