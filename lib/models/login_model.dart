class LoginModel {
  final bool status;
  final String? token;
  final String? message;
  final UserData? user;

  LoginModel({required this.status, this.token, this.message, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      token: json['token'],
      message: json['message'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String role; 

  UserData({required this.id, required this.name, required this.email, required this.role});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '', 
    );
  }
}