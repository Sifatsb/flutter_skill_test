
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/ProductData.dart';
import 'my_cart_page.dart';

class AllProductPage extends StatefulWidget {

  static const String routeName='/product';

  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  List<ProductData> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Product'),actions: [

        IconButton(onPressed: (){Navigator.pushNamed(context, MyCartPage.routeName);}, icon: Icon(Icons.save))
      ],),

      body: Card(
        child: FutureBuilder(
          future: getProductData(),
          builder: (context, snapshot){

            if(snapshot.data == null){
              print(snapshot.data);
              return Center(child: CircularProgressIndicator());
            }else{
              print(snapshot.data);
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Text(productList[index].title.toString())
                    ],
                  ));
            }
          },
        ),
      ),

      // body: Card(
      //   child: FutureBuilder(
      //     future: getProductData(),
      //     builder: (context, snapshot){
      //
      //       if(snapshot.data == null){
      //         return const Center(child: CircularProgressIndicator());
      //       }else{
      //
      //         return ListView.builder(
      //           itemCount: productList.length,
      //             itemBuilder: (context, index) => ListTile(
      //         title: Text("productList[index].title.toString()"),
      //         ));
      //       }
      //     },
      //   ),
      // ),

        );
  }


  Future getProductData() async {

    productList.clear();
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var products = jsonDecode(response.body) as List;

    for(var product in products){
      ProductData productData = ProductData.fromJson(product);
      productList.add(productData);
    }

    print('hello ${productList.length}');
    return productList;
  }

}
