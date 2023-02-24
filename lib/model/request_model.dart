class RequestModel {
  int? id;
  int? teacherId;
  String? teacherName;
  int? studentId;
  String? studentName;
  String? reason;
  String? requestTime;
  int? status;

  RequestModel(
      {this.id,
      this.teacherId,
      this.teacherName,
      this.studentId,
      this.studentName,
      this.reason,
      this.requestTime,
      this.status});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      teacherId: json['teacherId'],
      teacherName: json['teacherName'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      reason: json['reason'],
      requestTime: json['requestTime'],
      status: json['status'],
    );
  }
}
