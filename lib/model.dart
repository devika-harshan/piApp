class Users {
  final int id;
  final String name;
  final String email;
  final String password;

  const Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
      };
}

class UserPhone {
  final int id;
  final String name;
  final String phone;
  final String password;

  UserPhone(
      {required this.id,
      required this.name,
      required this.phone,
      required this.password});

  factory UserPhone.fromJson(Map<String, dynamic> json) {
    return UserPhone(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'password': password,
    };
  }
}
