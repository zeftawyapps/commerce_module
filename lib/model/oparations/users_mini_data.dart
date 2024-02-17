class UserMiniData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String image;
  int type = 0;

  UserMiniData({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.type,
  });

  factory UserMiniData.fromJson(Map<String, dynamic> json) {
    return UserMiniData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      type: json['type'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'image': image,
        'phone': phone,
        'type': type,
      };
}
