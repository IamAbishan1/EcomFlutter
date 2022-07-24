class Users {
  List<User>? users;
  bool? error;
  String? message;

  Users({this.users, this.error, this.message});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(new User.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNo;

  User({this.id, this.name, this.email, this.phoneNo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    return data;
  }
}
