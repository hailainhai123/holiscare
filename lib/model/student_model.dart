class StudentModel {
  int? id;
  String? name;
  int? classId;
  String? avatarUrl;
  String? userId;

  StudentModel(
      {this.id, this.classId, this.name, this.avatarUrl, this.userId});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      classId: json['classId'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      userId: json['userId'],
    );
  }
}