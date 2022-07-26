import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_skill_test/models/CartData.dart';

class MyCartPage extends StatefulWidget {

  static const String routeName='/my_cart';

  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

  List<CartData> cartProductList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page'),),

      body: Card(
        child: FutureBuilder(
          future: getCartProductData(),
          builder: (context, snapshot){

            if(snapshot.data == null){
              return Center(child: CircularProgressIndicator());
            }else{

              return ListView.builder(
                  itemCount: cartProductList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(cartProductList[index].id.toString()),
                  ));
            }
          },
        ),
      ),

    );
  }

  Future getCartProductData() async {
    cartProductList.clear();
    var response = await http.get(Uri.parse('https://fakestoreapi.com/carts'));
    var products = jsonDecode(response.body) as List;

    for(var product in products){
      CartData cartData = CartData.fromJson(product);
      cartProductList.add(cartData);
    }

     print('hello ${cartProductList.length}');
    return cartProductList;
  }


}
