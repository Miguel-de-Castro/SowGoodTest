class SGPacient {
  String? password,
      email,
      name,
      birthday,
      cpf,
      sex,
      medications,
      observations,
      alergies;
  late List<String> guardians;

  SGPacient(
      {required this.email,
      required this.password,
      this.name,
      this.birthday,
      this.cpf,
      this.sex,
      this.medications,
      this.observations,
      this.alergies});
}
