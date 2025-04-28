import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/styles.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, this.onChanged});

  final Function(String?)? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  final List<Map<String, dynamic>> items = [
    {
      'label': 'Home',
      'icon': kHomeIcon,
    },
    {
      'label': 'Personal',
      'icon': kPersonalIcon,
    },
    {
      'label': 'Work',
      'icon': kWorkIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9066,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 2),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text('Group', style: Styles.textStyle14.copyWith(
              color: Color(0xFF939393),
            ),),
            value: selectedValue,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged?.call(value);
            },
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item['label'],
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(item['icon'])
                    ),
                    SizedBox(width: 10),
                    Text(
                      item['label'],
                      style: Styles.textStyle14
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
