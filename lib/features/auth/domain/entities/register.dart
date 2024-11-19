class ClassName {
  final String email;
  final String password;

  ClassName({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory ClassName.fromJson(Map<String, dynamic> json) {
    return ClassName(
      email: json['email'],
      password: json['password'],
    );
  }
}
