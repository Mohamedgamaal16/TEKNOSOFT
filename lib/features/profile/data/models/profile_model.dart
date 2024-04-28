enum Gender { male, female }

class ProfileModel {
  final String name, userName, email, phone, password, imageLink;
  final Gender gender;

  const ProfileModel({
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.imageLink,
    required this.password,
    required this.gender,
  });
}
