class ApiConstants {
  static String baseUrl = const String.fromEnvironment('BASE_URL');
  static String patient = '$baseUrl/patients/self';
  static String doctor = '$baseUrl/patients/doctor/self';
  static String registerPatient = '$baseUrl/patients/register';
  static String getDiaryEvents = '$baseUrl/patients/diary/self';
  static String addDiary = '$baseUrl/patients/diary/create';
}
