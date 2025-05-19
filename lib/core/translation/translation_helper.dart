import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import '../cache/ cache_helper.dart';
import '../cache/cache_data.dart';
import '../cache/cache_keys.dart';
import 'ar.dart';
import 'en.dart';

enum AppLanguage {
  arabic,
  english,
}

class TranslationHelper implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheKeys.keyAR: ar,
    CacheKeys.keyEN: en,
  };

  static Future setLanguage() async
  {
    CacheData.lang = await CacheHelper.getData(key: CacheKeys.langKey);

    if (CacheData.lang == null)
    {
      switch (Get.deviceLocale?.languageCode) {
        case CacheKeys.keyAR:
          await CacheHelper.saveData(
              key: CacheKeys.langKey, value: CacheKeys.keyAR);
          await Get.updateLocale(TranslationKeys.localeAR);
          CacheData.lang = CacheKeys.keyAR;
          break;
        case CacheKeys.keyEN:
          await CacheHelper.saveData(
              key: CacheKeys.langKey, value: CacheKeys.keyEN);
          await Get.updateLocale(TranslationKeys.localeEN);
          CacheData.lang = CacheKeys.keyEN;
          break;

      }
    }
  }

  static changeLanguage(AppLanguage language) async
  {
    switch (language) {
      case AppLanguage.arabic:
        await CacheHelper.saveData(
          key: CacheKeys.langKey,
          value: CacheKeys.keyAR,
        );
        await Get.updateLocale(TranslationKeys.localeAR);
        CacheData.lang = CacheKeys.keyAR;
        break;

      case AppLanguage.english:
        await CacheHelper.saveData(
          key: CacheKeys.langKey,
          value: CacheKeys.keyEN,
        );
        await Get.updateLocale(TranslationKeys.localeEN);
        CacheData.lang = CacheKeys.keyEN;
        break;
    }
  }
}