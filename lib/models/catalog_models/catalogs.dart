class CatalogsModel {
  List<Catalogs>? catalogs;

  CatalogsModel({this.catalogs});

  CatalogsModel.fromJson(Map<String, dynamic> json) {
    if (json['catalogs'] != null) {
      catalogs = <Catalogs>[];
      json['catalogs'].forEach((v) {
        catalogs!.add(Catalogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (catalogs != null) {
      data['catalogs'] = catalogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catalogs {
  int? id;
  int? catalogId;
  int? integrationId;
  String? catalog;
  List<ChildrenRecursive>? childrenRecursive;

  Catalogs(
      {this.id,
      this.catalogId,
      this.integrationId,
      this.catalog,
      this.childrenRecursive});

  Catalogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catalogId = json['catalog_id'];
    integrationId = json['integration_id'];
    catalog = json['catalog'];
    if (json['children_recursive'] != null) {
      childrenRecursive = <ChildrenRecursive>[];
      json['children_recursive'].forEach((v) {
        childrenRecursive!.add(ChildrenRecursive.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['catalog_id'] = catalogId;
    data['integration_id'] = integrationId;
    data['catalog'] = catalog;
    if (childrenRecursive != null) {
      data['children_recursive'] =
          childrenRecursive!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildrenRecursive {
  int? id;
  String? catalog;
  int? catalogId;
  int? integrationId;
  //List<void>? childrenRecursive;

  ChildrenRecursive({
    this.id,
    this.catalog,
    this.catalogId,
    this.integrationId,
    //this.childrenRecursive,
  });

  ChildrenRecursive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catalog = json['catalog'];
    catalogId = json['catalog_id'];
    integrationId = json['integration_id'];
    // if (json['children_recursive'] != null) {
    //   childrenRecursive =  <void>[];
    //   json['children_recursive'].forEach((v) {
    //     childrenRecursive!.add( void.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['catalog'] = catalog;
    data['catalog_id'] = catalogId;
    data['integration_id'] = integrationId;
    // if (childrenRecursive != null) {
    //   data['children_recursive'] =
    //       childrenRecursive!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
