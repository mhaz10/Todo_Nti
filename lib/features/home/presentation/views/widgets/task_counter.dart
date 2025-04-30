import 'package:flutter/material.dart';

class TaskCounter extends StatelessWidget {
  const TaskCounter({super.key, required this.taskTitle, required this.taskCount});


  final String taskTitle;
  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(taskTitle),
          const SizedBox(width: 20,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: Color(0xFFCEEBDC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('$taskCount'),
          )
        ],
      ),
    );
  }
}