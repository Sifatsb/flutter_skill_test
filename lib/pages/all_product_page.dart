
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // height: MediaQuery.of(context).size.height / 2,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              ListTile(
                title: Text('MARENGOO', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: IconButton(onPressed: () { Navigator.pushNamed(context, MyCartPage.routeName); }, icon: Icon(Icons.shopping_cart, color: Colors.black,),),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('NEW IN', style: TextStyle(color: Colors.grey),),
                    Text('MENS', style: TextStyle(color: Colors.blue),),
                    Text('WOMENS', style: TextStyle(color: Colors.grey),),
                    Text('KIDS', style: TextStyle(color: Colors.grey),),
                    Text('ACCESSORIES', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),

              SizedBox(
                // height: 400,
                height: MediaQuery.of(context).size.height/2,
                child: FutureBuilder(
                  future: getProductData(),
                  builder: (context, snapshot){

                    if(snapshot.data == null){

                      return Center(child: CircularProgressIndicator());
                    }else{

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,

                          itemCount: productList.length,
                          itemBuilder: (context, index) => Column(
                            children: [

                              Card(

                                margin: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),

                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(productList[index].image!),
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),
                                    const Positioned(
                                            right: 0,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.green,
                                            )),


                                      ],
                                ),

                              ),

                              Container(
                                  width: 200,
                                  height: 60,
                                  color: Colors.white,
                                  child: Text('${productList[index].title}',textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),

                              Container(
                                  width: 200,
                                  height: 60,
                                  color: Colors.white,
                                  child: Text('Rs.${productList[index].price}',textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),

                            ],
                          ));
                    }
                  },
                ),
              ),

              SizedBox(

                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: getProductData(),
                  builder: (context, snapshot){

                    if(snapshot.data == null){

                      return Center(child: CircularProgressIndicator());
                    }else{

                      return ListView.builder(
                          scrollDirection: Axis.horizontal,

                          itemCount: productList.length,
                          itemBuilder: (context, index) => Column(
                            children: [

                              Card(

                                margin: EdgeInsets.all(20),

                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(productList[index].image!),
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),
                                    const Positioned(
                                        right: 0,
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.green,
                                        )),

                                    Positioned(
                                      bottom: 0, child: Container(
                                        width: 100,
                                        height: 25,
                                        color: Colors.white,
                                        child: Text(
                                          'Rs.${productList[index].price}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight:
                                              FontWeight.bold),
                                        )),
                                        ),


                                      ],
                                ),

                              ),

                              Container(
                                  width: 200,
                                  height: 60,
                                  color: Colors.white,
                                  child: Text('${productList[index].title}',textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),

                            ],
                          ));
                    }
                  },
                ),
              ),


              BottomNavigationBar(
                currentIndex: selectedIndex,
                selectedItemColor: Colors.white,
                backgroundColor: Colors.lightGreen,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.blue,),label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.grey,),label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.grey,),label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.grey,),label: ""),
                ],
              )

            ],


          ),
        ),


      ),


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


    return productList;
  }

}
