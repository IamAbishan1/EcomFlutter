class Order {
  List<OrderHistory>? orderHistory;
  bool? error;
  String? message;

  Order({this.orderHistory, this.error, this.message});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['order_history'] != null) {
      orderHistory = <OrderHistory>[];
      json['order_history'].forEach((v) {
        orderHistory!.add(new OrderHistory.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderHistory != null) {
      data['order_history'] =
          this.orderHistory!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class OrderHistory {
  int? id;
  String? orderDateTime;
  int? paymentType;
  String? paymentReference;
  int? status;
  List<Bag>? bag;

  OrderHistory(
      {this.id,
        this.orderDateTime,
        this.paymentType,
        this.paymentReference,
        this.status,
        this.bag});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDateTime = json['order_date_time'];
    paymentType = json['payment_type'];
    paymentReference = json['payment_reference'];
    status = json['status'];
    if (json['bag'] != null) {
      bag = <Bag>[];
      json['bag'].forEach((v) {
        bag!.add(new Bag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_date_time'] = this.orderDateTime;
    data['payment_type'] = this.paymentType;
    data['payment_reference'] = this.paymentReference;
    data['status'] = this.status;
    if (this.bag != null) {
      data['bag'] = this.bag!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bag {
  int? id;
  int? productId;
  int? unitPrice;
  int? quantity;
  Product? product;

  Bag({this.id, this.productId, this.unitPrice, this.quantity, this.product});

  Bag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  int? quantity;
  String? dateCreated;
  List<String>? images;
  List<int>? categories;

  Product(
      {this.id,
        this.name,
        this.price,
        this.discountPrice,
        this.description,
        this.quantity,
        this.dateCreated,
        this.images,
        this.categories});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    quantity = json['quantity'];
    dateCreated = json['date_created'];
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
    data['date_created'] = this.dateCreated;
    data['images'] = this.images;
    data['categories'] = this.categories;
    return data;
  }
}
