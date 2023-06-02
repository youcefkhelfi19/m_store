
class UserModel {
  String username;
  String email;
  String? userId;
  String phone;
  String address;
   String image;
   List<String> favorites;

  UserModel({required this.favorites,required this.image,required this.address,required this.username, required this.email, this.userId, required this.phone});

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'userId': userId,
    'phone': phone,
    'address':address,
    'image':image,
    'favorites':favorites,
  };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      userId: json['userId'],
      phone: json['phone'],
      image: json['image'],
      address: json['address'],
        favorites: List<String>.from(json['saved'])

    );
  }
}
