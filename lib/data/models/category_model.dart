class CategoryModel{
 String category_id;
 String category_name;
 String description;
 String image_url;
 String created_at;

 CategoryModel({required this.category_id,
                required this.category_name,
                required this.description,
                required this.image_url,
                required this.created_at,});
  
factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category_id: json['category_id'] ?? "",
      category_name: json['category_name'] ?? "",
      description: json['description'] ?? "",
      image_url: json['image_url'] ?? "",
      created_at: json['created_at'] ?? "",
    
    );
  }

 Map<String, dynamic> toJson() => {
        'category_id': category_id,
        "category_name": category_name,
        "description": description,
        "image_url": image_url,
        "created_at": created_at,
  };

  @override
  String toString() {
    return ''''
       category_id : $category_id,
       category_name : $category_name,
       description : $description,
       image_url : $image_url,
       created_at : $created_at, 
      ''';
  }

}