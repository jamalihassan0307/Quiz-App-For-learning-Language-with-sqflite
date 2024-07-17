import 'package:aris_language_learning/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  var selectedTabIndex = 0;
  var isLoading = false;
  var fullName = "";
  var profilePic = "";
  final UserDetail user = UserDetail(
      id: "id",
      firstname: "firstname",
      lastname: "lastname",
      email: "email",
      mobile: "mobile",
      about: "about",
      role: "role",
      isMobileNumberVerified: true,
      isEmailVerified: true,
      isBlocked: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 2,
      profilePic: "assets/logo.png");
}
