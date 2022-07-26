import 'Products.dart';

class CartData {
  CartData({
      this.id, 
      this.userId, 
      this.date, 
      this.products, 
      this.v,});

  CartData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    v = json['__v'];
  }
  int? id;
  int? userId;
  String? date;
  List<Products>? products;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['date'] = date;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    return map;
  }

}