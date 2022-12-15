class UserModel{
 String user_id;
 String full_name;
 String email;
 int age;
 String created_at;

 UserModel({required this.user_id,
                required this.full_name,
                required this.email,
                required this.age,
                required this.created_at,});
  
factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json['user_id'] ?? "",
      full_name: json['full_name'] ?? "",
      email: json['email'] ?? "",
      age: json['age'] ?? 0,
      created_at: json['created_at'] ?? "",
    
    );
  }

 Map<String, dynamic> toJson() => {
        'user_id': user_id,
        "full_name": full_name,
        "email": email,
        "age": age,
        "created_at": created_at,
  };

  @override
  String toString() {
    return ''' 
      age : $age,
      user_id : $user_id,
      full_name : $full_name,
      email : $email,
      created_at : $created_at,
      ''';
  }
}