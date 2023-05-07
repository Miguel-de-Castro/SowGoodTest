class ApiConstants {
  static String baseUrl = const String.fromEnvironment('BASE_URL');
  static String patient = '$baseUrl/patients/self';
  static String registerPatient = '$baseUrl/patients/register';
  static String addDiary = '$baseUrl/patients/diary/create';
}
