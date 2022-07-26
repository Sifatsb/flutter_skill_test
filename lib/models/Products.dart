class Products {
  Products({
      this.productId, 
      this.quantity,});

  Products.fromJson(dynamic json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }
  int? productId;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    map['quantity'] = quantity;
    return map;
  }

}