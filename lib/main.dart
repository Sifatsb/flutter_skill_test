import 'package:flutter/material.dart';
import 'package:flutter_skill_test/pages/all_product_page.dart';
import 'package:flutter_skill_test/pages/my_cart_page.dart';
import 'package:flutter_skill_test/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductProvider(),),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const AllProductPage(),

      // initialRoute: AllProductPage.routeName,
      routes: {
        AllProductPage.routeName: (context) => AllProductPage(),
        MyCartPage.routeName: (context) => MyCartPage(),
      },

    );
  }
}

