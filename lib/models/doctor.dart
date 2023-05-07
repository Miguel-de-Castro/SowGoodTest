class Doctor {
  Doctor({
    this.crm,
    this.description,
    this.name,
    this.expertise,
    this.adress,
  });

  String? crm;
  String? description;
  String? name;
  String? expertise;
  String? adress;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        crm: json['crm'],
        description: json['description'],
        name: json['name'],
        expertise: json['expertise'],
        adress: json['adress'],
      );

  Map<String, dynamic> toJson() => {
        'crm': crm,
        'name': name,
        'description': description,
        'expertise': expertise,
        'adress': adress,
      };
}
