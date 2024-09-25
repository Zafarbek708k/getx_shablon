


import 'language_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: "🇺🇸",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "🇷🇺",
      languageName: 'Russian',
      countryCode: 'RU',
      languageCode: 'ru',
    ),
    LanguageModel(
      imageUrl: "🇺🇿",
      languageName: 'Uzbek',
      countryCode: 'UZ',
      languageCode: 'uz',
    ),
  ];
}
