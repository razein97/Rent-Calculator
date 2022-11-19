class CountryConstants {
  static const Map<int, List> languages = <int, List>{
    1: ['Afrikaans', 'af'],
    2: ['Albanian', 'sq'],
    3: ['Amharic', 'am'],
    4: ['Arabic', 'ar'],
    5: ['Armenian', 'hy'],
    6: ['Azerbaijani', 'az'],
    7: ['Basque', 'eu'],
    8: ['Belarusian', 'be'],
    9: ['Bengali', 'bn'],
    10: ['Bosnian', 'bs'],
    11: ['Bulgarian', 'bg'],
    12: ['Catalan', 'ca'],
    13: ['Cebuano', 'ceb'],
    14: ['Chinese (Simplified)', 'zh-CN'],
    15: ['Chinese (Traditional)', 'zh-TW'],
    16: ['Corsican', 'co'],
    17: ['Croatian', 'hr'],
    18: ['Czech', 'cs'],
    19: ['Danish', 'da'],
    20: ['Dutch', 'nl'],
    21: ['English', 'en'],
    22: ['Esperanto', 'eo'],
    23: ['Estonian', 'et'],
    24: ['Finnish', 'fi'],
    25: ['French', 'fr'],
    26: ['Frisian', 'fy'],
    27: ['Galician', 'gl'],
    28: ['Georgian', 'ka'],
    29: ['German', 'de'],
    30: ['Greek', 'el'],
    31: ['Gujarati', 'gu'],
    32: ['Haitian Creole', 'ht'],
    33: ['Hausa', 'ha'],
    34: ['Hawaiian', 'haw'],
    35: ['Hebrew', 'iw'],
    36: ['Hindi', 'hi'],
    37: ['Hmong', 'hmn'],
    38: ['Hungarian', 'hu'],
    39: ['Icelandic', 'is'],
    40: ['Igbo', 'ig'],
    41: ['Indonesian', 'id'],
    42: ['Irish', 'ga'],
    43: ['Italian', 'it'],
    44: ['Japanese', 'ja'],
    45: ['Javanese', 'jv'],
    46: ['Kannada', 'kn'],
    47: ['Kazakh', 'kk'],
    48: ['Khmer', 'km'],
    49: ['Korean', 'ko'],
    50: ['Kurdish', 'ku'],
    51: ['Kyrgyz', 'ky'],
    52: ['Lao', 'lo'],
    53: ['Latin', 'la'],
    54: ['Latvian', 'lv'],
    55: ['Lithuanian', 'lt'],
    56: ['Luxembourgish', 'lb'],
    57: ['Macedonian', 'mk'],
    58: ['Malagasy', 'mg'],
    59: ['Malay', 'ms'],
    60: ['Malayalam', 'ml'],
    61: ['Maltese', 'mt'],
    62: ['Maori', 'mi'],
    63: ['Marathi', 'mr'],
    64: ['Mongolian', 'mn'],
    65: ['Myanmar (Burmese)', 'my'],
    66: ['Nepali', 'ne'],
    67: ['Norwegian', 'no'],
    68: ['Nyanja (Chichewa)', 'ny'],
    69: ['Pashto', 'ps'],
    70: ['Persian', 'fa'],
    71: ['Polish', 'pl'],
    72: ['Portuguese (Portugal, Brazil)', 'pt'],
    73: ['Punjabi', 'pa'],
    74: ['Romanian', 'ro'],
    75: ['Russian', 'ru'],
    76: ['Samoan', 'sm'],
    77: ['Scots Gaelic', 'gd'],
    78: ['Serbian', 'sr'],
    79: ['Sesotho', 'st'],
    80: ['Shona', 'sn'],
    81: ['Sindhi', 'sd'],
    82: ['Sinhala (Sinhalese)', 'si'],
    83: ['Slovak', 'sk'],
    84: ['Slovenian', 'sl'],
    85: ['Somali', 'so'],
    86: ['Spanish', 'es'],
    87: ['Sundanese', 'su'],
    88: ['Swahili', 'sw'],
    89: ['Swedish', 'sv'],
    90: ['Tagalog (Filipino)', 'tl'],
    91: ['Tajik', 'tg'],
    92: ['Tamil', 'ta'],
    93: ['Telugu', 'te'],
    94: ['Thai', 'th'],
    95: ['Turkish', 'tr'],
    96: ['Ukrainian', 'uk'],
    97: ['Urdu', 'ur'],
    98: ['Uzbek', 'uz'],
    99: ['Vietnamese', 'vi'],
    100: ['Welsh', 'cy'],
    101: ['Xhosa', 'xh'],
    102: ['Yiddish', 'yi'],
    103: ['Yoruba', 'yo'],
    104: ['Zulu', 'zu']
  };
  static const List<String> countryLaws = <String>[
    'India',
    'Nepal',
    'Bangladesh'
  ];
}

class FeedbackConstants {
  static const List<String> valueList = <String>[
    'UI',
    'Acts',
    'Navigation',
    'Other'
  ];
}

class SharedPreferencesConstants {
  static const String kLanguageCode = 'language';
  static const String kCountry = 'country';
  static const String firstRun = 'firstrun';
  static const String favoritesList = 'favorites';
  static const String themeData = 'themeData';
  static const String tokens = 'tokens';
  static const String fontSize = 'fontSize';
  static const String recentlyVisited = 'recentlyVisited';
  static const String recentlyViewedVisibility = 'recentlyViewedVisibility';
  static const String authToken = 'authToken';
  static const String actsListDownloaded = 'actsListDownloaded';
  static const String downloadedActs = 'downloadedActs';
  static const String downloadedTerms = 'downloadedTerms';
  static const String dbDeleted = 'dbDeleted';
  // static const String appUsage = 'appUsage';
  // static const String requestReview = 'requestReview';
  // static const String shouldRequestReview = 'shouldRequestReview';
  // static const String alreadyReview = 'shouldRequestReview';
  // static const String pdfTheme = 'pdfTheme';
  static const String wakeLock = 'wakeLock';
}

//TODO: ADD app store id
class AppConstants {
  static const double uiIconSize = 0.038;
  static const String appName = 'Lawnest';
  static const String appStoreID = 'Apple app store';
  static const String playStoreID = 'com.mw.lawnest';
  static const String playStoreLink =
      'https://play.google.com/store/apps/details?id=com.mw.lawnest';
}

class IndiaConstants {
  static const String legalTerms = 'assets/laws/india_laws/legal_terms.json';
}

class Constants {
  static const List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
}

// class APIConstants {
//   static const String loginUrl = 'http://192.168.43.243:5000/v1/auth/login';
//   static const String getActs = 'http://192.168.43.243:5000/v1/acts';
//   static const String getChapters =
//       'http://192.168.43.243:5000/v1/acts/chapters';

//   static const String getSchedules =
//       'http://192.168.43.243:5000/v1/acts/schedules';

//   static const String getActDetails =
//       'http://192.168.43.243:5000/v1/acts/actDetails';

//   static const String getSections =
//       'http://192.168.43.243:5000/v1/acts/sections';

//   static const String getJudgmentsRange =
//       'http://192.168.43.243:5000/v1/judgments/range';

//   static const String searchJudgments =
//       'http://192.168.43.243:5000/v1/judgments/searchJudgments';

//   static const String getJudgmentLink =
//       'http://192.168.43.243:5000/v1/judgments/judgmentLink';

//   static const String getScheduleLink =
//       'http://192.168.43.243:5000/v1/acts/scheduleLink';

//   static const String getLegalTerms =
//       'http://192.168.43.243:5000/v1/legal-terms';

//   static const String submitAProblem =
//       'http://192.168.43.243:5000/v1/feedback/problem';

//   static const String suggestImprovement =
//       'http://192.168.43.243:5000/v1/feedback/improvement';

//   static const String markActOutdated =
//       'http://192.168.43.243:5000/v1/acts/mark_outdated';

//   static const String getCalendars = 'http://192.168.43.243:5000/v1/calendars';

//   static const String getCalendarLink =
//       'http://192.168.43.243:5000/v1/calendars/calendarLink';
// }

class APIConstants {
  static const String loginUrl =
      'https://lawnest.maniacworkapis.com/auth/login';
  static const String getActs = 'https://lawnest.maniacworkapis.com/acts';
  static const String getChapters =
      'https://lawnest.maniacworkapis.com/acts/chapters';

  static const String getSchedules =
      'https://lawnest.maniacworkapis.com/acts/schedules';

  static const String getActDetails =
      'https://lawnest.maniacworkapis.com/acts/actDetails';

  static const String getSections =
      'https://lawnest.maniacworkapis.com/acts/sections';

  static const String getJudgmentsRange =
      'https://lawnest.maniacworkapis.com/judgments/range';

  static const String searchJudgments =
      'https://lawnest.maniacworkapis.com/judgments/searchJudgments';

  static const String getJudgmentLink =
      'https://lawnest.maniacworkapis.com/judgments/judgmentLink';

  static const String getScheduleLink =
      'https://lawnest.maniacworkapis.com/acts/scheduleLink';

  static const String getLegalTerms =
      'https://lawnest.maniacworkapis.com/legal-terms';

  static const String submitAProblem =
      'https://lawnest.maniacworkapis.com/feedback/problem';

  static const String suggestImprovement =
      'https://lawnest.maniacworkapis.com/feedback/improvement';

  static const String markActOutdated =
      'https://lawnest.maniacworkapis.com/acts/mark_outdated';

  static const String getCalendars =
      'https://lawnest.maniacworkapis.com/calendars';

  static const String getCalendarLink =
      'https://lawnest.maniacworkapis.com/calendars/calendarLink';

  static const String getMCQ =
      "https://lawnest.maniacworkapis.com/quiz?type=multiple";

  static const String getTrueFalse =
      "https://lawnest.maniacworkapis.com/quiz?type=boolean";
}

// class BangladeshConstants {
//   static const String actsList =
//       'assets/acts_json_data/bangladesh_laws/acts_list.json';
//   static const String legalTerms =
//       'assets/acts_json_data/bangladesh_laws/legal_terms.json';
// }
