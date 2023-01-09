import 'dart:convert';

class Department {
  int? idDepartment;
  String? titleDepartment;
  String? colorDepartment;
  Department({
    this.idDepartment,
    this.titleDepartment,
    this.colorDepartment,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDepartment': idDepartment,
      'titleDepartment': titleDepartment,
      'colorDepartment': colorDepartment,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      idDepartment:
          map['idDepartment'] != null ? map['idDepartment'] as int : null,
      titleDepartment: map['titleDepartment'] != null
          ? map['titleDepartment'] as String
          : null,
      colorDepartment: map['colorDepartment'] != null
          ? map['colorDepartment'] as String
          : '0xff30FAC2',
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source) as Map<String, dynamic>);
}
