import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFCEEBDC),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Frist Task '),
                const SizedBox(height: 20,),
                SizedBox(
                    width: 180,
                    child: Text('Improve my English skills by trying to speek', maxLines: 2, overflow: TextOverflow.ellipsis,))
              ],
            ),
          ),
          Column(
            children: [
              Text('11/03/2025'),
              const SizedBox(height: 10,),
              Text('05:00 PM')
            ],
          ),
        ],
      ),
    );
  }
}