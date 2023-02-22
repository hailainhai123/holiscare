class ApiResponse {
  bool? status;
  dynamic data;
  List<ApiError>? errors;

  ApiResponse({this.status, this.data, this.errors});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    if (json['errors'] != null) {
      errors = <ApiError>[];
      json['errors'].forEach((v) {
        errors!.add(ApiError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApiError {
  int? code;
  String? message;

  ApiError({this.code, this.message});

  ApiError.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
