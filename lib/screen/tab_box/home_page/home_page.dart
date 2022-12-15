import 'dart:math';

import 'package:device_shop_app/data/models/category_model.dart';
import 'package:device_shop_app/screen/tab_box/card/card_page.dart';
import 'package:device_shop_app/screen/tab_box/inside_page/inside_page.dart';
import 'package:device_shop_app/view_models/categories_view_model.dart';
import 'package:device_shop_app/view_models/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home"),
       
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            child: Container(
              decoration: BoxDecoration(
               color: Colors.blueGrey[200], 
               borderRadius: BorderRadius.circular(16),
               boxShadow: [
                BoxShadow(
                  offset: Offset(2,2),
                  spreadRadius: 1,
                  blurRadius: 1
                )
               ]
              ),
              
              height: MediaQuery.of(context).size.height*0.3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width:2),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3,3),
                      spreadRadius: 2,
                      blurRadius: 2
                    )
                  ] 

                ),
                child: StreamBuilder<List<CategoryModel>>(
                  stream: Provider.of<CategoriesViewModel>(context, listen: false)
                      .listenCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = snapshot.data!;
                      return ListView(
                        children: [
                          ListTile(
                            title: Text("All",style: TextStyle(fontSize: 20,color: Colors.white),),
                            onTap: () {
                              Provider.of<ProductViewModel>(
                                context,
                                listen: false,
                              ).listenProducts("");
                            },
                          ),
                          ...List.generate(
                            categories.length,
                            (index) => ListTile(
                              title: Text(categories[index].category_name,style: TextStyle(fontSize: 20,color: Colors.white),),
                              onTap: () {
                                Provider.of<ProductViewModel>(
                                  context,
                                  listen: false,
                                ).listenProducts(categories[index].category_id);
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(child: Consumer<ProductViewModel>(
            builder: (context, productViewModel, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                   color: Colors.blueGrey[200], 
                   borderRadius: BorderRadius.circular(16),
                   boxShadow: [
                    BoxShadow(
                      offset: Offset(2,2),
                      spreadRadius: 2,
                      blurRadius: 2
                    )
                   ]
                  ),
                  
                  child: ListView(
                    children:
                        List.generate(productViewModel.products.length, (index) {
                      var product = productViewModel.products[index];
                      return ListTile(
                        trailing: IconButton(onPressed: () {
                          Provider.of<ProductViewModel>(context,listen: false).lenthProduct = index;
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>InsidePage(productModel: product,)));
                        },
                        icon: Icon(Icons.input_sharp),
                        ),
                        title: Text(product.product_name, style: TextStyle(fontSize: 20),),
                        onTap: () {},
                      );
                    }),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}