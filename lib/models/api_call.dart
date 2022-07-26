import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ProductData.dart';

class getDataFromApi {
  Future<List<ProductData>> getData() async {
    List<ProductData> productListData=[];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://fakestoreapi.com/products'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData=await response.stream.bytesToString();
        List<dynamic> data=jsonDecode(rawData);
        data.forEach((element) {
          ProductData model=ProductData.fromJson(element);
          productListData.add(model);
        });
        return productListData;
      } else {
        print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print("Exception in Data $e");
      throw e;
    }
  }
}