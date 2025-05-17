import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'core/cache/ cache_helper.dart';
import 'core/cache/cache_data.dart';
import 'core/translation/translation_helper.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  print('\x1B[31mThis is red text\x1B[0m');
  print('\x1B[32mThis is green text\x1B[0m');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(CacheData.lang!),
      translations: TranslationHelper(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: GoogleFonts.lexendDeca().fontFamily
      ),
      home: SplashView(),
    );
  }
}