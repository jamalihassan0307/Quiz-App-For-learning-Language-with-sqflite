class UserDetail {
  UserDetail({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.about,
    required this.role,
    required this.isMobileNumberVerified,
    required this.isEmailVerified,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.profilePic,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? about;
  final String? role;
  final bool? isMobileNumberVerified;
  final bool? isEmailVerified;
  final bool? isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePic;

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      about: json["about"],
      role: json["role"],
      isMobileNumberVerified: json["isMobileNumberVerified"],
      isEmailVerified: json["isEmailVerified"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      profilePic: json["profilePic"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "about": about,
        "role": role,
        "isMobileNumberVerified": isMobileNumberVerified,
        "isEmailVerified": isEmailVerified,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePic": profilePic,
      };
}
