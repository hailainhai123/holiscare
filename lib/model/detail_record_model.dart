class DetailRecordModel {
  int? id;
  int? studentId;
  String? studentName;
  int? classId;
  String? className;
  String? yearSchool;
  DateTime? recordTime;
  List<AttributesRecord>? attributes;
  String? note;
  String? conclusion;

  DetailRecordModel({
    this.id,
    this.studentId,
    this.studentName,
    this.classId,
    this.className,
    this.yearSchool,
    this.recordTime,
    this.attributes,
    this.note,
    this.conclusion,
  });

  factory DetailRecordModel.fromJson(Map<String, dynamic> json) {
    return DetailRecordModel(
      id: json['id'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      classId: json['classId'],
      className: json['className'],
      yearSchool: json['yearSchool'],
      recordTime: DateTime.parse(json['recordTime']),
      attributes: (json['attributes'] as List<dynamic>).map((e) => AttributesRecord.fromJson(e)).toList(),
      note: json['note'],
      conclusion: json['conclusion'],
    );
  }
}

class AttributesRecord {
  int? id;
  String? value;
  TypeRecord? type;

  AttributesRecord({this.id, this.value, this.type});

  factory AttributesRecord.fromJson(Map<String, dynamic> json) {
    return AttributesRecord(
      id: json['id'],
      value: json['value'],
      type : json['type'] != null ? TypeRecord.fromJson(json['type']) : null,
    );
  }
}

class TypeRecord {
  int? id;
  String? code;
  String? name;
  String? unit;

  TypeRecord({this.id, this.code, this.name, this.unit});

  factory TypeRecord.fromJson(Map<String, dynamic> json) {
    return TypeRecord(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      unit: json['unit'],
    );
  }
}
