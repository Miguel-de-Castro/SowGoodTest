class Doctor {
  Doctor({
    this.crm,
    this.description,
    this.name,
    this.expertise,
    this.address,
    this.rqe,
  });

  String? crm;
  String? description;
  String? name;
  String? expertise;
  String? address;
  String? rqe;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        crm: json['crm'],
        description: json['description'],
        name: json['name'],
        expertise: json['expertise'],
        address: json['address'],
        rqe: json['rqe'],
      );

  Map<String, dynamic> toJson() => {
        'crm': crm,
        'name': name,
        'description': description,
        'expertise': expertise,
        'adress': address,
        'rqe': rqe,
      };
}
