// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String id;
  String firstname;
  String lastname;
  String email;
  String mobile;
  String? profilePic;
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    this.profilePic,
  });

  UserModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? mobile,
    String? profilePic,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  String toMap() {
    return "'$id','$firstname','$lastname','$email','$mobile','$profilePic'";
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      mobile: map['mobile'],
      profilePic: map['profilePic'],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, firstname: $firstname, lastname: $lastname, email: $email, mobile: $mobile, profilePic: $profilePic)';
  }
}
