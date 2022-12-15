class OrderModel{
 String order_id;
 String product_id;
 int count;
 int total_price;
 String created_at;
 String user_id;
 String order_status;
 String product_name;

 OrderModel({required this.order_id,
                required this.product_id,
                required this.count,
                required this.total_price,
                required this.created_at,
                required this.user_id,
                required this.order_status,
                required this.product_name,
                });

 OrderModel copyWith({
    int? count,
    int? total_price,
    String? order_id,
    String? product_id,
    String? user_id,
    String? order_status,
    String? created_at,
    String? product_name,
  }) =>
      OrderModel(
        count: count ?? this.count,
        total_price: total_price ?? this.total_price,
        order_id: order_id ?? this.order_id,
        product_id: product_id ?? this.product_id,
        order_status: order_status ?? this.order_status,
        created_at: created_at ?? this.created_at,
        user_id: user_id ?? this.user_id,
        product_name: product_name ?? this.product_name,
      );
  
factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      order_id: json['order_id'] ?? "",
      product_id: json['product_id'] ?? "",
      count: json['count'] ?? 0,
      total_price: json['total_price'] ?? 0,
      created_at: json['created_at'] ?? "",
      user_id: json['user_id'] ?? "",
      order_status: json['order_status'] ?? "",
      product_name: json['product_name'] ?? "",
    
    );
  }

 Map<String, dynamic> toJson() => {
        'order_id': order_id,
        "product_id": product_id,
        "count": count,
        "total_price": total_price,
        "created_at": created_at,
        "user_id": user_id,
        "order_status": order_status,
        'product_name': product_name,
  };

  @override
  String toString() {
    return '''
      count: $count,
      total_price: $total_price,
      order_id: $order_id,
      product_id: $product_id,
      user_id: $user_id,
      order_status: $order_status,
      created_at: $created_at,
      product_name: $product_name,
      ''';
  }
}