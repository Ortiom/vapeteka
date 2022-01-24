class ProductsModel {
  List<Products>? products;

  ProductsModel({this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
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

class Products {
  int? id;
  String? integrationId;
  String? name;
  int? price;
  int? amount;
  String? whCode;
  String? whName;
  String? images;
  String? brand;
  String? flavor;
  String? nomenclature;
  String? klass;
  String? power;
  String? volume;
  String? withFlavors;
  String? madeIn;
  String? itemNoDiscount;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  int? check;
  int? initialPrice;

  Products({
    this.id,
    this.integrationId,
    this.name,
    this.price,
    this.amount,
    this.whCode,
    this.whName,
    this.images,
    this.brand,
    this.flavor,
    this.nomenclature,
    this.klass,
    this.power,
    this.volume,
    this.withFlavors,
    this.madeIn,
    this.itemNoDiscount,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.check,
    this.initialPrice,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    integrationId = json['integration_id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    whCode = json['wh_code'];
    whName = json['wh_name'];
    images = json['images'];
    brand = json['brand'];
    flavor = json['flavor'];
    nomenclature = json['nomenclature'];
    klass = json['class'];
    power = json['power'];
    volume = json['volume'];
    withFlavors = json['with_flavors'];
    madeIn = json['made_in'];
    itemNoDiscount = json['item_no_discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['integration_id'] = integrationId;
    data['name'] = name;
    data['price'] = price;
    data['amount'] = amount;
    data['wh_code'] = whCode;
    data['wh_name'] = whName;
    data['images'] = images;
    data['brand'] = brand;
    data['flavor'] = flavor;
    data['nomenclature'] = nomenclature;
    data['class'] = klass;
    data['power'] = power;
    data['volume'] = volume;
    data['with_flavors'] = withFlavors;
    data['made_in'] = madeIn;
    data['item_no_discount'] = itemNoDiscount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['category_id'] = categoryId;
    data['check'] = check;
    return data;
  }
}
