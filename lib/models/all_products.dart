class AllProducts {
  List<ProductDetail>? products;
  bool? error;
  String? message;

  AllProducts({this.products, this.error, this.message});

  AllProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductDetail>[];
      json['products'].forEach((v) {
        products!.add(new ProductDetail.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  int? quantity;
  String? createdDate;
  List<String>? images;
  List<int>? categories;

  ProductDetail(
      {this.id,
        this.name,
        this.price,
        this.discountPrice,
        this.description,
        this.quantity,
        this.createdDate,
        this.images,
        this.categories});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    quantity = json['quantity'];
    createdDate = json['created_date'];
    images = json['images'].cast<String>();
    categories = json['categories'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['created_date'] = this.createdDate;
    data['images'] = this.images;
    data['categories'] = this.categories;
    return data;
  }
}
