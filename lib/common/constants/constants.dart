class Constants {
  static String get tokenKey => 'token-key';
  static String get authDataKey => 'auth-data-key';
}

class APIConstants {
  static String get baseUrl => 'https://api.prawirahirya.com/';
}

class APIPath {
  static String get apiVersion => 'kepolisian/api/v1/';
  static String get login => 'login';
  static String get psikotest => '$apiVersion/cat-test/kepribadian';
  static String get akademik => '$apiVersion/cat-test/akademik';
  static String get ketahanan => '$apiVersion/cat-test/ketahanan';
  static String get submitPsikotest => '$apiVersion/cat-answer/kepribadian';
  static String get submitAkademik => '$apiVersion/cat-answer/akademik';
  static String get submitKetahanan => '$apiVersion/cat-answer/ketahanan';
}
