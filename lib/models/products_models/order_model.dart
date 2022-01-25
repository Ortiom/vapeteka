class Order {
  List<ProductsForOrder>? products;

  Order({this.products});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsForOrder>[];
      json['products'].forEach((v) {
        products!.add(ProductsForOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsForOrder {
  int? productId;
  int? quantity;

  ProductsForOrder({this.productId, this.quantity});

  ProductsForOrder.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}
