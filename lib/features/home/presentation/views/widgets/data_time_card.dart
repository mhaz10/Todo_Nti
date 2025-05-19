import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';

import '../../../../../core/utils/text_styles.dart';

class DateTimeCard extends StatefulWidget {
  const DateTimeCard({super.key, this.onDateTimeSelected});

  final Function(String formattedDate, String formattedTime)? onDateTimeSelected;

  @override
  State<DateTimeCard> createState() => _DateTimeCardState();
}

class _DateTimeCardState extends State<DateTimeCard> {
  String? formattedDate;
  String? formattedTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );

        if (selectedDate != null) {
          TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
          );

          if (selectedTime != null) {
            setState(() {
              formattedDate = "${selectedDate.day} ${getMonthName(selectedDate.month)}, ${selectedDate.year}";
              formattedTime = "${_formatTime(selectedTime.hour)}:${_formatMinute(selectedTime.minute)} ${_getAmPm(selectedTime.hour)}";
            });
            widget.onDateTimeSelected?.call(formattedDate!, formattedTime!);
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9066,
        height: MediaQuery.of(context).size.height * 0.0985,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 2),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.calendarIcon),
            SizedBox(width: 8.0),
            Text(
              formattedDate != null && formattedTime != null ? '$formattedDate   $formattedTime' : TranslationKeys.endDate.tr,
              style: TextStyles.textStyle14.copyWith(
                color: formattedDate != null && formattedTime != null ? Colors.black : Color(0xFFB7B7B7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  String _formatTime(int hour) {
    return (hour % 12 == 0) ? '12' : '${hour % 12}';
  }

  String _formatMinute(int minute) {
    return minute < 10 ? '0$minute' : '$minute';
  }

  String _getAmPm(int hour) {
    return hour < 12 ? 'am' : 'pm';
  }
}