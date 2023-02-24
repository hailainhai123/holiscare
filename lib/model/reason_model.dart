class ReasonModel {
  String? reason;
  String? time;
  int? teacherId;

  ReasonModel({this.reason, this.time, this.teacherId});

  factory ReasonModel.fromJson(Map<String, dynamic> json) {
    return ReasonModel(
        reason : json['reason'],
        time : json['time'],
        teacherId : json['teacherId'],
    );

  }

  Map<String, dynamic> toJson() => {
    "reason": reason,
    "time": time,
    "teacherId": teacherId,
  };
}