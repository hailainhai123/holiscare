class TeacherModel {
  int? id;
  String? name;

  TeacherModel(
      {this.id, this.name});

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'],
      name: json['name'],
    );
  }
}