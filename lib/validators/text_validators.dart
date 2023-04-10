class TextValidator {
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateNumberWithSize(
      String value, num size, String message) {
    // ignore: prefer_interpolation_to_compose_strings
    String pattern = r'\d{' + size.toString() + '}';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value) || value.length > size || value.length < size) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  static String? validatePassword(String value) {
    String pattern = r'(?=.*[0-9a-zA-Z]).{6,}';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Senha inválida, precisa conter no mínimo 6 caracteres';
    }
    return null;
  }
}
