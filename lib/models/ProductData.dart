class ProductData {
  ProductData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Rating.fromJson(json['rating']);
  }

  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductData copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) =>
      ProductData(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['category'] = category;
    map['image'] = image;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    return map;
  }
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }

  num? rate;
  int? count;

  Rating copyWith({
    num? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }
}




// class ProductData {
//   ProductData({
//       this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.rating,});
//
//   ProductData.fromJson(dynamic json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
//   }
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;
// ProductData copyWith({  int? id,
//   String? title,
//   double? price,
//   String? description,
//   String? category,
//   String? image,
//   Rating? rating,
// }) => ProductData(  id: id ?? this.id,
//   title: title ?? this.title,
//   price: price ?? this.price,
//   description: description ?? this.description,
//   category: category ?? this.category,
//   image: image ?? this.image,
//   rating: rating ?? this.rating,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['price'] = price;
//     map['description'] = description;
//     map['category'] = category;
//     map['image'] = image;
//     if (rating != null) {
//       map['rating'] = rating?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Rating {
//   Rating({
//       this.rate,
//       this.count,});
//
//   Rating.fromJson(dynamic json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//   double? rate;
//   int? count;
// Rating copyWith({  double? rate,
//   int? count,
// }) => Rating(  rate: rate ?? this.rate,
//   count: count ?? this.count,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['rate'] = rate;
//     map['count'] = count;
//     return map;
//   }
//
// }