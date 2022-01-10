class UserModel {
  final String id, firstName, lastName, email, phone, image;
  final bool gender;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.email,
      required this.image,
      required this.phone,
      required this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final email = json['email'];
    final image = json['image'];
    final id = json['id'];
    final gender = json['gender'];
    final phone = json['phone'];

    return UserModel(firstName: firstName, lastName: lastName, id: id, email: email, image: image, phone: phone, gender: gender);
  }

  UserModel copyWith({
    String? id,
    String? facebookId,
    String? name,
  }) =>
      UserModel(
          image: image, id: id ?? this.id, firstName: firstName, lastName: lastName, gender: gender, phone: phone, email: email);

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'email': email,
        'last_name': lastName,
        'image': image,
        'phone': phone,
        'gender': gender,
        'id': id,
      };
}
