import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {

  static const String routeName='/my_cart';

  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page'),),
    );
  }
}
