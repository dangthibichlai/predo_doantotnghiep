import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/services/language/st_en_us.dart';
import 'package:test_intern/services/language/st_es_es.dart';
import 'package:test_intern/services/language/st_fr_fr.dart';
import 'package:test_intern/services/language/st_hi_in.dart';
import 'package:test_intern/services/language/st_pt_pt.dart';
import 'package:test_intern/services/language/st_vn_vi.dart';

import '../share_preference._helper.dart';

class LocalizationService extends Translations {
// Get locale.
  static final locale = _getLocaleFromLanguage();

// Locale default.
  static const fallbackLocale = Locale('vi', 'VN');

  static final langCodes = [
    'en',
    'vi',
    'zh',
    'es',
    'hi',
    'fr',
    'ru',
    'pt',
    'de',
    'ja',
    'tr',
    'ko',
    'it',
    'th',
  ];

  // Locale have support.
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
    const Locale('zh', 'CN'),
    const Locale('es', 'ES'),
    const Locale('hi', 'IN'),
    const Locale('fr', 'FR'),
    const Locale('ru', 'RU'),
    const Locale('pt', 'PT'),
    const Locale('de', 'DE'),
    const Locale('ja', 'JN'),
    const Locale('tr', 'TR'),
    const Locale('ko', 'KR'),
    const Locale('it', 'IT'),
    const Locale('th', 'TH'),
  ];

// Language data to change.
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
    'zh': 'Trung quốc',
    'es': 'Tây Ban Nha',
    'hi': 'Ấn Độ',
    'fr': 'Pháp',
    'ru': 'Nga',
    'pt': 'Bồ Đào Nhà',
    'de': 'Đức',
    'ja': 'Nhật Bản',
    'tr': 'Thổ Nhĩ Kỳ',
    'ko': 'Hàn Quốc',
    'it': 'Italy',
    'th': 'Thái Lan',
  });

  // Multi Language data to change.
   final multiLangs = LinkedHashMap.from({
    'en': 'language_001'.tr,
    'vi': 'Tiếng Việt',
    'zh': 'Trung quốc',
    'es': 'language_002'.tr,
    'hi': 'language_004'.tr,
    'fr': 'language_005'.tr,
    'ru': 'language_005'.tr,
    'pt': 'language_003'.tr,
    'de': 'Đức',
    'ja': 'Nhật Bản',
    'tr': 'Thổ Nhĩ Kỳ',
    'ko': 'Hàn Quốc',
    'it': 'Italy',
    'th': 'Thái Lan',
  });

  ///
  /// On change language.
  ///
  static void changeLocale(String langCode) {
    //
    // Save locale.
    sl<SharedPreferenceHelper>().setLocale(langCode);
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
        'es_ES': es,
        'hi_IN': hi,
        'fr_FR': fr,
        'pt_PT': pt,
      };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    late String lang;
    if (AppValidate.nullOrEmpty(langCode) && !AppValidate.nullOrEmpty(sl<SharedPreferenceHelper>().getLocale)) {
      lang = sl<SharedPreferenceHelper>().getLocale.toString();
    } else if (!AppValidate.nullOrEmpty(langCode)) {
      lang = langCode.toString();
    } else {
      if (Get.deviceLocale!.languageCode != 'vi') {
        lang = Get.deviceLocale!.languageCode;
      } else {
        lang = 'en';
      }

      // Save locale.
      sl<SharedPreferenceHelper>().setLocale(lang);
    }
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }

    DefaultCupertinoLocalizations.load(locale);
    return Get.locale!;
  }
}
