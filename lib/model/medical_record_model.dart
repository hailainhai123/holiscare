class MedicalRecordModel {
  int? id;
  int? studentId;
  String? yearSchool;
  String? title;
  DateTime? recordTime;

  MedicalRecordModel(
      {this.id, this.studentId, this.yearSchool, this.title, this.recordTime});

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['id'],
      studentId: json['studentId'],
      yearSchool: json['yearSchool'],
      title: json['title'],
      recordTime: DateTime.parse(json['recordTime']),
    );
  }
}
