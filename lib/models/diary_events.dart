class DiaryEvents {
  DiaryEvents({
    this.title,
    this.description,
    this.date,
    this.link,
  });

  String? title;
  String? description;
  String? date;
  String? link;

  factory DiaryEvents.fromJson(Map<String, dynamic> json) => DiaryEvents(
        title: json['title'],
        description: json['description'],
        date: json['date'],
        link: json['birth_date'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date,
        'birth_date': link,
      };
}
