// ignore_for_file: constant_identifier_names

class ApiConstants {
  ApiConstants._();

  static const String BASE_URL = String.fromEnvironment('BASE_URL');
  static const String API_KEY = "3f80fb72251a907226071cafeb8455d0";
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500/";
  static const String WIREDASH_PROJECT =
      String.fromEnvironment('WIREDASH_PROJECT');
  static const String WIREDASH_SECRET =
      String.fromEnvironment('WIREDASH_SECRET');
}
