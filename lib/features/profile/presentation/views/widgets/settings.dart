import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import '../../../../../core/utils/text_styles.dart';
import 'language_toggle.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftIcon),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Language', style: TextStyles.textStyle20),
                  Spacer(),
                  LanguageToggle(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
