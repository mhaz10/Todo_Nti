import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/widgets/custom_text_form_field.dart';
import 'package:todo_app_nti/core/widgets/image_picker/image_manager_view.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: ImageManagerView(onPicked: (image) {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            CustomTextFormField(hintText: TranslationKeys.userName.tr),
          ],
        ),
      ),
    );
  }
}
