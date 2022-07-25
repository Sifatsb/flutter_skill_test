
import 'package:flutter/material.dart';

class AllProductPage extends StatefulWidget {

  static const String routeName='/product';

  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Product'),),
    );
  }
}
