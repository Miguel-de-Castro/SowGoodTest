class Patient {
  Patient({
    this.password,
    this.email,
    this.name,
    this.birthDate,
    this.cpf,
    this.sex,
    this.medicalData,
    this.guardians,
  });

  String? password;
  String? email;
  String? name;
  String? birthDate;
  String? cpf;
  String? sex;
  MedicalData? medicalData;
  List<String>? guardians;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        password: json['password'],
        email: json['email'],
        name: json['name'],
        birthDate: json['birth_date'],
        cpf: json['cpf'],
        sex: json['sex'],
        medicalData: MedicalData.fromJson(json['medical_data']),
        guardians: List<String>.from(json['guardians'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'password': password,
        'email': email,
        'name': name,
        'birth_date': birthDate,
        'cpf': cpf,
        'sex': sex,
        'medical_data': medicalData!.toJson(),
        'guardians': List<dynamic>.from(guardians!.map((String x) => x)),
      };
}

class MedicalData {
  MedicalData({
    this.alergies,
    this.medications,
    this.observations,
  });

  String? alergies;
  String? medications;
  String? observations;

  factory MedicalData.fromJson(Map<String, dynamic> json) => MedicalData(
        alergies: json['alergies'] ?? '',
        medications: json['medications'] ?? '',
        observations: json['observations'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'alergies': alergies,
        'medications': medications,
        'observations': observations,
      };
}

class Diary {
  Diary({this.title, this.date, this.description, this.link});
  String? title;
  String? date;
  String? description;
  String? link;

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        title: json['title'],
        date: json['date'],
        description: json['description'],
        link: json['link'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'description': description,
        'link': link,
      };
}
