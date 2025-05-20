import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/add_task_view_body.dart';

import '../../../../core/cache/cache_data.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/translation/translation_keys.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(CacheData.lang ==  CacheKeys.keyEN ? AppIcons.arrowLeftIcon : AppIcons.arrowRightIcon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(TranslationKeys.addTask.tr),
      ),
      body: const AddTaskViewBody(),
    );
  }
}
