class Address {
  List<Adresses>? adresses;
  bool? error;
  String? message;

  Address({this.adresses, this.error, this.message});

  Address.fromJson(Map<String, dynamic> json) {
    if (json['adresses'] != null) {
      adresses = <Adresses>[];
      json['adresses'].forEach((v) {
        adresses!.add(new Adresses.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adresses != null) {
      data['adresses'] = this.adresses!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Adresses {
  int? id;
  String? city;
  String? street;
  String? description;
  String? province;

  Adresses({this.id, this.city, this.street, this.description, this.province});

  Adresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    street = json['street'];
    description = json['description'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['street'] = this.street;
    data['description'] = this.description;
    data['province'] = this.province;
    return data;
  }
}
