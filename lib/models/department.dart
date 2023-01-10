import 'dart:convert';

class Department {
  String nameDepart;
  String? colorDepart;
  Department({
    required this.nameDepart,
    this.colorDepart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameDepart': nameDepart,
      'colorDepart': colorDepart,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      nameDepart: map['nameDepart'] as String,
      colorDepart:
          map['colorDepart'] != null ? map['colorDepart'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source) as Map<String, dynamic>);
}
