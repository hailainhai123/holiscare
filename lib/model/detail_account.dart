class DetailAccount {
  String? id;
  String? username;
  String? gender;
  String? fullName;
  String? phone;
  String? address;
  String? email;
  String? dob;
  String? age;
  String? avatar;
  String? personalId;
  String? insuranceNumber;
  String? roleName;
  String? roleDisplayName;
  String? staffCode;

  DetailAccount(
      {this.id,
        this.username,
        this.gender,
        this.fullName,
        this.phone,
        this.address,
        this.email,
        this.dob,
        this.age,
        this.avatar,
        this.personalId,
        this.insuranceNumber,
        this.roleName,
        this.roleDisplayName,
        this.staffCode});

  DetailAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    gender = json['gender'];
    fullName = json['fullName'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    dob = json['dob'];
    age = json['age'];
    avatar = json['avatar'];
    personalId = json['personalId'];
    insuranceNumber = json['insuranceNumber'];
    roleName = json['roleName'];
    roleDisplayName = json['roleDisplayName'];
    staffCode = json['staffCode'];
  }
}