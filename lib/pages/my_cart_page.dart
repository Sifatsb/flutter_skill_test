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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Loading Cart......', style: TextStyle(color: Colors.black, fontSize: 25),),
          SizedBox(height: 30,),
          Center(child: CircularProgressIndicator())
        ],
      ),

    );
  }


}
