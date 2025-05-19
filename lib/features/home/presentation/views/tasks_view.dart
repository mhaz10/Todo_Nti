import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_view_body.dart';
import '../../../../core/cache/cache_data.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/utils/text_styles.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

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
        title: Text(TranslationKeys.tasks.tr, style: TextStyles.textStyle20),
        centerTitle: true,
      ),
      body: TasksViewBody(),
    );
  }
}
