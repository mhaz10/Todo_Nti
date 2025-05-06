import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *0.0862),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0492, left: 16, right: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kProfileView);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(kLoginImage),
                  ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(kButtonColor),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddTaskView);
        },
        child: SvgPicture.asset(kAddTaskIcon,),
      ),
      body: HomeViewBody(),
    );
  }
}
