class User {
  final String id;
  final String name;
  final String email;
  final String userType;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      userType: json['userType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'userType': userType,
    };
  }
}
