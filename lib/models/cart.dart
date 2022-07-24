class Cart {
  List<CartProducts>? products;
  bool? error;
  String? message;

  Cart({this.products, this.error, this.message});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <CartProducts>[];
      json['products'].forEach((v) {
        products!.add(new CartProducts.fromJson(v));
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

class CartProducts {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  int? quantity;
  String? dateCreated;
  List<String>? images;
  List<int>? categories;
  int? cartQuantity;
  int? cartId;

  CartProducts(
      {this.id,
        this.name,
        this.price,
        this.discountPrice,
        this.description,
        this.quantity,
        this.dateCreated,
        this.images,
        this.categories,
        this.cartQuantity,
        this.cartId});

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    quantity = json['quantity'];
    dateCreated = json['date_created'];
    images = json['images'].cast<String>();
    categories = json['categories'].cast<int>();
    cartQuantity = json['cart_quantity'];
    cartId = json['cart_id'];
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
    data['cart_quantity'] = this.cartQuantity;
    data['cart_id'] = this.cartId;
    return data;
  }
}
