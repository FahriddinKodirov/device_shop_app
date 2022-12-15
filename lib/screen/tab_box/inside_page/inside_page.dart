import 'dart:collection';
import 'dart:ffi';

import 'package:device_shop_app/data/models/order_model.dart';
import 'package:device_shop_app/data/models/product_model.dart';
import 'package:device_shop_app/view_models/orders_view_model.dart';
import 'package:device_shop_app/view_models/products_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class InsidePage extends StatefulWidget {
final ProductModel productModel;

  const InsidePage({super.key,required this.productModel});

  @override
  State<InsidePage> createState() => _InsidePageState();
}

class _InsidePageState extends State<InsidePage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inside Page',style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.black,
      elevation: 100,
      ),
      body:  Consumer<ProductViewModel>(
        builder: (context, productViewModel, child) {
          var products = productViewModel.products[productViewModel.lenthProduct];
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                    offset: Offset(5,5),
                    spreadRadius: 3,
                    blurRadius: 3
                    )
                  ]
                ),
                child: Padding(
                  padding:  EdgeInsets.only(right: 16,left: 16,bottom: 16,),
                  child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[100], 
                             
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal[100]!,
                                  offset: Offset(-1,1),
                                  spreadRadius: 17,
                                  blurRadius: 17
                                )
                              ],
                              
                              
                        
                        borderRadius: BorderRadius.circular(12) 
                        ),
                        
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            
                            Center(
                            child: Text(products.product_name,style: TextStyle(fontSize: 30),)),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              height: 180,
                              width: 400,
                              decoration: BoxDecoration(
                              color: Colors.white,  
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(6,6),
                                  spreadRadius: -10,
                                  blurRadius: 2
                                )
                              ],
                              ),
                              
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJxTwmWKVn0lm2bS7ZfNwY7bQvsUT8HrJWpg&usqp=CAU',),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01),
                             Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.topRight,
                              
                              child: Text('${products.created_at}',style: TextStyle(fontSize: 10))),
                            
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.topLeft,  
                            child: Text('Discription',style: TextStyle(fontSize: 20))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.topLeft,
                             child: Text(products.description,style: TextStyle(fontSize: 16,color: Colors.black54))),
                             SizedBox(height: MediaQuery.of(context).size.height*0.06),
                           
               
                           
              
              
                               
                          ],
                        ),
                        
                      ),
                ),
              ),

              Positioned(
                left: MediaQuery.of(context).size.width*0.04,
                top: MediaQuery.of(context).size.height*0.7,
                child: Count(products, context)),
              Positioned(
                left: MediaQuery.of(context).size.width*0.26,
                top: MediaQuery.of(context).size.height*0.77,
                child: buy(products, context)),
            ],
          );
           
  }),
    );

  }

  Widget Count(products, context){
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.138),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        
                        Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                          child: Row(
                            children: [
                              Container(
                            height: MediaQuery.of(context).size.height*0.048,
                            width: MediaQuery.of(context).size.width*0.12,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                  if (count > 1) {
                                    count--;
                                  }
                                });
                                },
                                child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(3,3),
                                    blurRadius: 3,
                                    spreadRadius: 1
                                  )]
                                ),  
                                child: Center(child: Text('-',style: TextStyle(fontSize: 20)))),
                              ),
                            ),
                            ), 
                           SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                           Container(
                       alignment: Alignment.topLeft,
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.3,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              boxShadow: [BoxShadow(
                                color: Colors.black,
                                offset: Offset(3,3),
                                blurRadius: 3,
                                spreadRadius: 1
                              )]
                            ),  
                            child: Center(child: Text('count: ${count}',style: TextStyle(fontSize: 20)))),
                          ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                             Container(
                            height: MediaQuery.of(context).size.height*0.048,
                            width: MediaQuery.of(context).size.width*0.12,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                  count++;
                                  
                                });
                                },
                                child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(3,3),
                                    blurRadius: 3,
                                    spreadRadius: 1
                                  )]
                                ),  
                                child: Center(child: Text('+',style: TextStyle(fontSize: 20)))),
                              ),
                            ),
                            ),
                          ],),
                        )
      ],),
    );
  }

  Widget buy(products, context){
    return InkWell(

      onTap: () {
        List<OrderModel> orders = 
             Provider.of<OrdersViewModel>(context, listen: false).userOrders;
             List<OrderModel> exists = orders
                      .where((element) => element.product_id == widget.productModel.product_id)
                      .toList();
                    if(exists.isNotEmpty){
                      orders.forEach((element) {
                        if(element.product_id == widget.productModel.product_id){
                          Provider.of<OrdersViewModel>(context, listen: false).
                          updateOrderIfExists(productId: element.product_id,count: count);
                        }
                      });
                    } else {
                      Provider.of<OrdersViewModel>(context, listen: false).addOrder(
                             OrderModel(
                              order_id: '', 
                              product_id: widget.productModel.product_id, 
                              count: count, 
                              total_price: widget.productModel.price * count, 
                              created_at: DateTime.now().toString(), 
                              user_id: FirebaseAuth.instance.currentUser!.uid, 
                              order_status: 'ordered',
                              product_name: widget.productModel.product_name
                              )
                      );
                    }

      },
                      child: Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(3,3),
                                      blurRadius: 3,
                                      spreadRadius: 1
                                    )]
                                  ),  
                                  child: Center(child: Text('купить ${products.price}\$',style: TextStyle(fontSize: 20)))),
                                ),
                                ),
    );
  }
}
  //                       else {
  //                   Provider.of<OrdersViewModel>(context, listen: false)
  //                       .addOrder(
  //                     OrderModel(
  //                         count: count,
  //                         total_price: widget.productModel.price * count,
  //                         order_id: "",
  //                         product_id: widget.productModel.product_id,
  //                         user_id: FirebaseAuth.instance.currentUser!.uid,
  //                         order_status: "ordered",
  //                         created_at: DateTime.now().toString(),
  //                        ),
  //                   );
  //                 }
  //                 Navigator.pop(context);
  //               },
  //               child: Text("Add to card"))
  //         ],
  //       ),
  //     ),