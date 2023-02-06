class HealthRequestModel {
  int? id;
  String? name;
  String? teacher;
  String? reason;
  String? time;

  HealthRequestModel({
    this.id,
    this.name,
    this.teacher,
    this.reason,
    this.time,
  });

  HealthRequestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '',
        teacher = json['teacher'] ?? '',
        reason = json['reason'] ?? '',
        time = json['time'] ?? '';

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'teacher': teacher,
    'reason': reason,
    'time': time,
  };
}
