class Products {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  int? quantity;
  String? dateCreated;
  List<String>? images;
  List<int>? categories;
  int? wishlistId;

  Products(
      {this.id,
        this.name,
        this.price,
        this.discountPrice,
        this.description,
        this.quantity,
        this.dateCreated,
        this.images,
        this.categories,
        this.wishlistId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    quantity = json['quantity'];
    dateCreated = json['date_created'];
    images = json['images'].cast<String>();
    categories = json['categories'].cast<int>();
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['date_created'] = this.dateCreated;
    data['images'] = this.images;
    data['categories'] = this.categories;
    data['wishlist_id'] = this.wishlistId;
    return data;
  }
}