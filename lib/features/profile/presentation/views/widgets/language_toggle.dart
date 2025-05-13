import 'package:flutter/material.dart';

import '../../../../../core/cache/cache_data.dart';
import '../../../../../core/cache/cache_keys.dart';
import '../../../../../core/translation/translation_helper.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  bool isEnglish = CacheData.lang == CacheKeys.keyEN ?  true :  false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TranslationHelper.changeLanguage(!isEnglish);
      },
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isEnglish = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isEnglish ? Colors.grey[300] : Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'AR',
                    style: TextStyle(
                      color: isEnglish ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isEnglish = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isEnglish ? Colors.green : Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'EN',
                    style: TextStyle(
                      color: isEnglish ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
