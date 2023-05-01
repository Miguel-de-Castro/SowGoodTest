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

  static String? validateCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    if (cpf.length != 11) {
      return 'CPF Inválido, por favor escreva um CPF válido';
    }

    var soma = 0;
    for (var i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    var resto = (soma * 10) % 11;
    var digito1 = (resto == 10) ? 0 : resto;
    if (digito1 != int.parse(cpf[9])) {
      return 'CPF Inválido, por favor escreva um CPF válido';
    }

    soma = 0;
    for (var i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    resto = (soma * 10) % 11;
    var digito2 = (resto == 10) ? 0 : resto;
    if (digito2 != int.parse(cpf[10])) {
      return 'CPF Inválido, por favor escreva um CPF válido';
    }

    return null;
  }
}
