import 'package:device_shop_app/data/models/order_model.dart';
import 'package:device_shop_app/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key, required this.orderModel}) : super(key: key);
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Card info"),
        ),
        body: Consumer<OrdersViewModel>(
          builder: (context, orderViewModel, child) {
            if (orderViewModel.productModel != null) {
              var product = orderViewModel.productModel!;
              return Padding(
                padding:  EdgeInsets.only(right: 10,left: 10,bottom: 30,),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 420,
                        child:  Image.network(product.product_images[1],fit: BoxFit.cover,),
                      ),
                      Text(orderModel.product_name, style: TextStyle(fontSize: 30,color: Colors.black),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                      alignment: Alignment.topLeft,  
                      child: Text('Discription: ${product.description}',style: TextStyle(fontSize: 18,color: Colors.black),)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03),
                      Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                      alignment: Alignment.topLeft,    
                      child: Text('Price: ${product.price}', style: TextStyle(fontSize: 20,color: Colors.black),)),

                      Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                      alignment: Alignment.topLeft,   
                      child: Text('Count: ${orderModel.count}', style: TextStyle(fontSize: 20,color: Colors.black),)),
                      Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                      alignment: Alignment.topLeft,   
                      child: Text('Total_price: ${orderModel.total_price}', style: TextStyle(fontSize: 20,color: Colors.black),)),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                        alignment: Alignment.center,   
                        child: Image.asset('assets/images/image10.png')),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}