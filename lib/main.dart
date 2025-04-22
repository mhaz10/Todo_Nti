import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF3F5F4),
      ),
    );
  }
}
