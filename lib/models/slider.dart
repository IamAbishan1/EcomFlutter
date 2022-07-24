class Slider {
  List<Sliders>? sliders;
  bool? error;
  String? message;

  Slider({this.sliders, this.error, this.message});

  Slider.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(new Sliders.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Sliders {
  int? id;
  int? type;
  String? image;
  String? desc;
  int? relatedId;

  Sliders({this.id, this.type, this.image, this.desc, this.relatedId});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    desc = json['desc'];
    relatedId = json['related_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['related_id'] = this.relatedId;
    return data;
  }
}
