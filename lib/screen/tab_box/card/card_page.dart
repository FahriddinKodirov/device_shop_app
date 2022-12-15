
import 'package:device_shop_app/screen/tab_box/card/card_info.dart';
import 'package:device_shop_app/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Card"),
      ),
      body: Consumer<OrdersViewModel>(
        builder: (context, orderViewModel, child) {
          return ListView(
            children: List.generate(orderViewModel.userOrders.length, (index) {
              var order = orderViewModel.userOrders[index];
              return InkWell(
                onTap: () {
                  orderViewModel.getSingleProduct(order.product_id);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => CardInfo(orderModel: order,)));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      color: Colors.teal[300],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-1,2),
                          blurRadius: 1,
                          spreadRadius: 1
                        )
                      ]
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(child: Text(order.product_name,style: TextStyle(fontSize: 18,color: Colors
                        .white),)),
                        Container(child: Text('Count: ${order.count}',style: TextStyle(fontSize: 18,color: Colors
                        .white)))
                      ]),
                    ),
                  ),
                ),
              );
              
            }),
          );
        },
      ),
    );
  }
}