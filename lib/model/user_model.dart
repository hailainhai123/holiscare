class UserModel {
  String? taiKhoan;
  String? matKhau;
  String? ten;
  String? lop;
  String? gioiTinh;

  UserModel({
    this.taiKhoan,
    this.matKhau,
    this.ten,
    this.lop,
    this.gioiTinh,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : taiKhoan = json['taiKhoan'] ?? '',
        matKhau = json['matKhau'] ?? '',
        ten = json['ten'] ?? '',
        lop = json['lop'] ?? '',
        gioiTinh = json['gioiTinh'] ?? '';

  Map<String, dynamic> toJson() => {
        'taiKhoan': taiKhoan,
        'matKhau': matKhau,
        'ten': ten,
        'lop': lop,
        'gioiTinh': gioiTinh,
      };
}
