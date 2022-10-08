// ignore_for_file: constant_identifier_names

class ApiConstants {
  ApiConstants._();

  static const String BASE_URL = String.fromEnvironment('BASE_URL');
  static const String API_KEY = String.fromEnvironment('API_KEY');
  static const String BASE_IMAGE_URL = String.fromEnvironment('BASE_IMAGE_URL');
  static const String WIREDASH_PROJECT =
      String.fromEnvironment('WIREDASH_PROJECT');
  static const String WIREDASH_SECRET =
      String.fromEnvironment('WIREDASH_SECRET');
}
