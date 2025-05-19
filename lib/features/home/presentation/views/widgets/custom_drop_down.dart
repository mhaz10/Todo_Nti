import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';

import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, this.onChanged});

  final Function(String?)? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  final List<Map<String, dynamic>> items = [
    {'label': TranslationKeys.homeTask.tr, 'icon': AppIcons.homeIcon},
    {'label': TranslationKeys.personalTask.tr, 'icon': AppIcons.personalIcon},
    {'label': TranslationKeys.workTask.tr , 'icon': AppIcons.workIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: AppResponsive.width(context, value: 340),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey, width: 2),
          color: AppColors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              TranslationKeys.group.tr,
              style: TextStyles.textStyle14.copyWith(color: AppColors.grey),
            ),
            value: selectedValue,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged?.call(value);
            },
            items:
                items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item['label'],
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(item['icon']),
                        ),
                        SizedBox(width: 10),
                        Text(item['label'], style: TextStyles.textStyle14),
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
