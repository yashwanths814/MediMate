import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
  }) =>
      [enText, hiText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'g1srpnnb': {
      'en': 'Register',
      'hi': 'पंजीकरण करवाना',
      'kn': 'ನೋಂದಣಿ',
    },
    '0yszpyey': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    '253x8w2z': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // Login
  {
    'ptj8zphx': {
      'en': 'Enter Email',
      'hi': 'ईमेल दर्ज करें',
      'kn': 'ಇಮೇಲ್ ನಮೂದಿಸಿ',
    },
    'vy4yh2rl': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'pl2ts0vy': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'vbgzp11z': {
      'en': 'Don’t have an account yet? ',
      'hi': 'अब तक कोई खाता नहीं है?',
      'kn': 'ಇನ್ನೂ ಖಾತೆಯನ್ನು ಹೊಂದಿಲ್ಲವೇ?',
    },
    'xr6qb3t3': {
      'en': 'Register',
      'hi': 'पंजीकरण करवाना',
      'kn': 'ನೋಂದಣಿ',
    },
    'n70kl7bt': {
      'en': 'Please fill in a valid email address...',
      'hi': 'कृपया एक मान्य ईमेल पता भरें...',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ಭರ್ತಿ ಮಾಡಿ...',
    },
    'tz7h6thr': {
      'en': 'That password doesn\'t match.',
      'hi': 'वह पासवर्ड मेल नहीं खाता.',
      'kn': 'ಆ ಪಾಸ್‌ವರ್ಡ್ ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ.',
    },
    'y0m9vsko': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // myTasks
  {
    '39rwvu9k': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'kn': 'ನನ್ನ ಕಾರ್ಯಗಳು',
    },
    'ozoyrab0': {
      'en': 'Scheduled Tasks',
      'hi': 'नियत कार्य',
      'kn': 'ನಿಗದಿತ ಕಾರ್ಯಗಳು',
    },
    'ne7545th': {
      'en': '--',
      'hi': '--',
      'kn': '--',
    },
  },
  // Register
  {
    'lobvejey': {
      'en': '',
      'hi': 'पूरा नाम',
      'kn': '',
    },
    'a3ktlyfi': {
      'en': 'Enter your name here...',
      'hi': 'अपना नाम यहाँ दर्ज करें...',
      'kn': 'ನಿಮ್ಮ ಹೆಸರನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'brzjs9re': {
      'en': '',
      'hi': 'मेल पता',
      'kn': '',
    },
    'y0b84z4p': {
      'en': 'Enter your email here...',
      'hi': 'अपना ई मेल यहा भरे...',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'tlvfbq2u': {
      'en': '',
      'hi': 'पासवर्ड',
      'kn': '',
    },
    '946e479d': {
      'en': 'Enter your password here...',
      'hi': 'यहां अपना पासवर्ड डालें...',
      'kn': 'ನಿಮ್ಮ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'ayfedhru': {
      'en': '',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': '',
    },
    'zw2qnqvi': {
      'en': 'Confirm password here...',
      'hi': 'यहां पासवर्ड की पुष्टि करें...',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ಇಲ್ಲಿ ದೃಢೀಕರಿಸಿ...',
    },
    '471iaqvq': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
    },
    'erc0s441': {
      'en': 'Already have a account ? ',
      'hi': 'क्या आपके पास पहले से ही एक खाता है?',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆಯನ್ನು ಹೊಂದಿರುವಿರಾ?',
    },
    'yvsh7y10': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    '0ii58guy': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // CompletedTasks
  {
    'ha90go7u': {
      'en': 'Completed Tasks',
      'hi': 'पूर्ण किये गये कार्य',
      'kn': 'ಪೂರ್ಣಗೊಂಡ ಕಾರ್ಯಗಳು',
    },
    '6d4snu43': {
      'en': '--',
      'hi': '--',
      'kn': '--',
    },
  },
  // EditProfile
  {
    'b1ezmne7': {
      'en': 'Update Account Information',
      'hi': 'लेखा जानकारी को अद्यतन बनाएं',
      'kn': 'ಖಾತೆ ಮಾಹಿತಿಯನ್ನು ನವೀಕರಿಸಿ',
    },
    'lfzts2d7': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು',
    },
    'ffrcbeqz': {
      'en': 'Please enter your full name...',
      'hi': 'कृपया अपना पूरा नाम दर्ज करें...',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಪೂರ್ಣ ಹೆಸರನ್ನು ನಮೂದಿಸಿ...',
    },
    '4tl00r49': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    'rygqkzrz': {
      'en': 'Your email...',
      'hi': 'आपका ईमेल...',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್...',
    },
    '8x0l5p9l': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'kn': 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸು',
    },
    'ahi2bttv': {
      'en': 'To Change Password',
      'hi': 'पासवर्ड बदलने के लिए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಬದಲಾಯಿಸಲು',
    },
    'qaiw3gnf': {
      'en': 'Please fill in a valid email address...',
      'hi': 'कृपया एक मान्य ईमेल पता भरें...',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ಭರ್ತಿ ಮಾಡಿ...',
    },
    '7bdle15n': {
      'en': 'Please fill in a valid email address...',
      'hi': 'कृपया एक मान्य ईमेल पता भरें...',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ಭರ್ತಿ ಮಾಡಿ...',
    },
    '0ffev7l1': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'kn': 'ಪ್ರೊಫೈಲ್ ಬದಲಿಸು',
    },
    'xrm0zrlq': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // TaskDetails
  {
    'quqxbowi': {
      'en': 'Due',
      'hi': 'देय',
      'kn': 'ಕಾರಣ',
    },
    '8siu91i6': {
      'en': 'Mark As Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'kn': 'ಪೂರ್ಣಗೊಂಡಿದೆ ಎಂದು ಗುರುತಿಸಿ',
    },
    '1t9ohkmo': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // MyProfile
  {
    'b2rve2l4': {
      'en': 'Welcome',
      'hi': 'स्वागत',
      'kn': 'ಸ್ವಾಗತ',
    },
    'ijth90jh': {
      'en': 'Account Information',
      'hi': 'खाता संबंधी जानकारी',
      'kn': 'ಖಾತೆ ಮಾಹಿತಿ',
    },
    'uycca37c': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'kn': 'ಪ್ರೊಫೈಲ್ ಬದಲಿಸು',
    },
    'pj214yir': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
    },
    'ultn888l': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड पर स्विच करें',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್‌ಗೆ ಬದಲಿಸಿ',
    },
    'z0fxbn0j': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड पर स्विच करें',
      'kn': 'ಲೈಟ್ ಮೋಡ್‌ಗೆ ಬದಲಿಸಿ',
    },
    'yhogy2rf': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    'keqz9ger': {
      'en': 'App Version v0.0',
      'hi': 'ऐप संस्करण v0.0',
      'kn': 'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ v0.0',
    },
    'ufrto7ws': {
      'en': '--',
      'hi': '--',
      'kn': '--',
    },
  },
  // ChangePassword
  {
    '5nzzkbau': {
      'en':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'hi':
          'अपना ईमेल दर्ज करें और हम इसे अपडेट करने के लिए आपके ईमेल पर एक रीसेट पासवर्ड लिंक भेजेंगे।',
      'kn':
          'ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ನಮೂದಿಸಿ ಮತ್ತು ಅದನ್ನು ನವೀಕರಿಸಲು ನಿಮ್ಮ ಇಮೇಲ್‌ಗೆ ನಾವು ಮರುಹೊಂದಿಸುವ ಪಾಸ್‌ವರ್ಡ್ ಲಿಂಕ್ ಅನ್ನು ಕಳುಹಿಸುತ್ತೇವೆ.',
    },
    'uvz7g19g': {
      'en': 'Email address here...',
      'hi': 'ईमेल पता यहाँ...',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ ಇಲ್ಲಿ...',
    },
    'o2tdst43': {
      'en': 'We will send a link to your email...',
      'hi': 'हम आपके ईमेल पर एक लिंक भेजेंगे...',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್‌ಗೆ ನಾವು ಲಿಂಕ್ ಕಳುಹಿಸುತ್ತೇವೆ...',
    },
    'm2bj04h7': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'kn': 'ಲಿಂಕ್ ಕಳುಹಿಸಿ',
    },
    'afov788c': {
      'en': 'Back',
      'hi': 'पीछे',
      'kn': 'ಹಿಂದೆ',
    },
    't50mf7rv': {
      'en': 'Please fill in a new password..',
      'hi': 'कृपया नया पासवर्ड भरें..',
      'kn': 'ದಯವಿಟ್ಟು ಹೊಸ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ..',
    },
    'e0qtymvo': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'kn': 'ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ',
    },
    '0pxmb3th': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // chat
  {
    '8smvnnza': {
      'en': 'Enter prompt...',
      'hi': 'शीघ्र दर्ज करें...',
      'kn': 'ಪ್ರಾಂಪ್ಟ್ ನಮೂದಿಸಿ...',
    },
    'djc37mf2': {
      'en': 'Generate',
      'hi': 'उत्पन्न',
      'kn': 'ರಚಿಸಿ',
    },
    '2oj4w2j0': {
      'en': 'MediMate Assistant',
      'hi': 'मेडीमेट सहायक',
      'kn': 'ಮೆಡಿಮೇಟ್ ಸಹಾಯಕ',
    },
    'ycn262qg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // emptyList_tasks
  {
    '85proi4n': {
      'en': 'You don\'t have any tasks',
      'hi': 'आपके पास कोई कार्य नहीं है',
      'kn': 'ನೀವು ಯಾವುದೇ ಕಾರ್ಯಗಳನ್ನು ಹೊಂದಿಲ್ಲ',
    },
    'fopkabbs': {
      'en': 'Create tasks by tapping the button below.',
      'hi': 'नीचे दिए गए बटन को टैप करके कार्य बनाएं।',
      'kn': 'ಕೆಳಗಿನ ಬಟನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡುವ ಮೂಲಕ ಕಾರ್ಯಗಳನ್ನು ರಚಿಸಿ.',
    },
    'tauu1gfv': {
      'en': 'Create Task',
      'hi': 'कार्य बनाएँ',
      'kn': 'ಕಾರ್ಯವನ್ನು ರಚಿಸಿ',
    },
  },
  // CreateTask_new
  {
    '4s6a8zy1': {
      'en': 'Add Task',
      'hi': 'कार्य जोड़ें',
      'kn': 'ಕಾರ್ಯವನ್ನು ಸೇರಿಸಿ',
    },
    '5sa2dfnh': {
      'en': 'Fill out the details below to add a new task.',
      'hi': 'नया कार्य जोड़ने के लिए नीचे विवरण भरें।',
      'kn': 'ಹೊಸ ಕಾರ್ಯವನ್ನು ಸೇರಿಸಲು ಕೆಳಗಿನ ವಿವರಗಳನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
    },
    'co2my3hc': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'kn': 'ಕಾರ್ಯದ ಹೆಸರು',
    },
    'jisdqh7x': {
      'en': 'Enter your task here....',
      'hi': 'अपना कार्य यहां दर्ज करें....',
      'kn': 'ನಿಮ್ಮ ಕೆಲಸವನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ....',
    },
    'qzcoox91': {
      'en': 'Details',
      'hi': 'विवरण',
      'kn': 'ವಿವರಗಳು',
    },
    '9vhe6o85': {
      'en': 'Enter a description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'kn': 'ವಿವರಣೆಯನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'v6nm9qtp': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
      'kn': 'ರದ್ದುಮಾಡಿ',
    },
    'g1siyvtg': {
      'en': 'Create Task',
      'hi': 'कार्य बनाएँ',
      'kn': 'ಕಾರ್ಯವನ್ನು ರಚಿಸಿ',
    },
  },
  // CreateTask_Edit
  {
    'epf0n05l': {
      'en': 'Add Task',
      'hi': 'कार्य जोड़ें',
      'kn': 'ಕಾರ್ಯವನ್ನು ಸೇರಿಸಿ',
    },
    'lihxznez': {
      'en': 'Fill out the details below to add a new task.',
      'hi': 'नया कार्य जोड़ने के लिए नीचे विवरण भरें।',
      'kn': 'ಹೊಸ ಕಾರ್ಯವನ್ನು ಸೇರಿಸಲು ಕೆಳಗಿನ ವಿವರಗಳನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
    },
    'dq8e1g33': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'kn': 'ಕಾರ್ಯದ ಹೆಸರು',
    },
    'w9u7gtg1': {
      'en': 'Enter your task here....',
      'hi': 'अपना कार्य यहां दर्ज करें....',
      'kn': 'ನಿಮ್ಮ ಕೆಲಸವನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ....',
    },
    '306yq53b': {
      'en': 'Details',
      'hi': 'विवरण',
      'kn': 'ವಿವರಗಳು',
    },
    'g9z7uskw': {
      'en': 'Enter a description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'kn': 'ವಿವರಣೆಯನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'cws64kgh': {
      'en': 'Current Due Date',
      'hi': 'वर्तमान देय तिथि',
      'kn': 'ಪ್ರಸ್ತುತ ಅಂತಿಮ ದಿನಾಂಕ',
    },
    'bpvi2ibi': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
      'kn': 'ರದ್ದುಮಾಡಿ',
    },
    'u4gtdttp': {
      'en': 'Update Task',
      'hi': 'कार्य अद्यतन करें',
      'kn': 'ಕಾರ್ಯವನ್ನು ನವೀಕರಿಸಿ',
    },
  },
  // Miscellaneous
  {
    '1267bfvs': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'qh1sgu2c': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'h4jdva0g': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'qqm4chyq': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'mtauky8f': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ksdmbuwe': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'aqarrybv': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'tobb6uet': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'c1jq36tg': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'oo3nwoxs': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ai40ieuw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zrj5b0ur': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'cev7v1ik': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'f10z8b0k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'opcy5lhc': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'vqp6yov1': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'slshg17h': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'svy0zjxx': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zj3h00ww': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'xcy1w66o': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5d13k23p': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'q0fy60wr': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    've4l03qw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'aly14556': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'uzv2k7wl': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
