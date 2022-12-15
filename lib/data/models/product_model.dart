class ProductModel{
 String product_id;
 String category_id;
 String product_name;
 List<dynamic> product_images;
 int    price;
 int    count;
 String description;
 String created_at;
 String currency;

 ProductModel({ required this.product_id,
                required this.category_id,
                required this.product_name,
                required this.product_images,
                required this.price,
                required this.count,
                required this.description,
                required this.created_at,
                required this.currency,});
  
factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      product_id: json['product_id'] ?? "",
      category_id: json['category_id'] ?? "",
      product_name: json['product_name'] ?? "",
      product_images: (json['product_images']  as List<dynamic>? ?? []),
      price: json['price'] ?? 0,
      count: json['count'] ?? 0,
      description: json['description'] ?? "",
      created_at: json['created_at'] ?? "",
      currency: json['currency'] ?? "",
    
    
    );
  }

 Map<String, dynamic> toJson() => {
        'product_id': product_id,
        "category_id": category_id,
        "product_name": product_name,
        "product_images": product_images,
        'price': price,
        "count": count,
        "description": description,
        "created_at": created_at,
        "currency": currency,
    };

     @override
  String toString() {
    return '''
      count: $count,
      price: $price,
      product_images: $product_images,
      category_id: $category_id,
      product_id: $product_id,
      product_name: $product_name,
      description: $description,
      created_at: $created_at,
      currency: $currency
      ''';
  }

}