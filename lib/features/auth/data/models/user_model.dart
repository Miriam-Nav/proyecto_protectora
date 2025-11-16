class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String maidenName;
  final String email;
  final String phone;
  final String image;
  final String birthDate;

  const User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.email,
    required this.phone,
    required this.image,
    required this.birthDate,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String? ?? '',
      firstName: map['firstName'] as String? ?? '',
      lastName: map['lastName'] as String? ?? '',
      maidenName: map['maidenName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      image: map['image'] as String? ?? '',
      birthDate: map['birthDate'] as String? ?? '',
    );
  }
}
