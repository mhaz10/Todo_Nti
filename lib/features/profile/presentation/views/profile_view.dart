import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/profile_view_body.dart';

import '../../../../core/constants/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(kLoginImage),
                ),
                SizedBox(width: 14,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
      body: ProfileViewBody(),
    );
  }
}
