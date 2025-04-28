import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/widgets/custom_text_form_field.dart';

import '../../../../../core/constants/constants.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(300), child: Image.asset(
        kLoginImage,
        fit: BoxFit.fill,
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: const Column(
          children: [
            CustomTextFormField(hintText: 'User Name'),
          ],
        ),
      ),
    );
  }
}
