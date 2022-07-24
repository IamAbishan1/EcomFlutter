class LogInResponse {
  bool? error;
  String? name;
  String? email;
  String? apiKey;
  String? createdAt;
  String? phoneNo;
  bool? isStaff;

  LogInResponse(
      {this.error,
        this.name,
        this.email,
        this.apiKey,
        this.createdAt,
        this.phoneNo,
        this.isStaff});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    email = json['email'];
    apiKey = json['apiKey'];
    createdAt = json['createdAt'];
    phoneNo = json['phone_no'];
    isStaff = json['is_staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['email'] = this.email;
    data['apiKey'] = this.apiKey;
    data['createdAt'] = this.createdAt;
    data['phone_no'] = this.phoneNo;
    data['is_staff'] = this.isStaff;
    return data;
  }
}
