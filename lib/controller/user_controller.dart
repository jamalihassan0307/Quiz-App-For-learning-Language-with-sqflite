import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  var selectedTabIndex = 0;
  var isLoading = false;
  var fullName = "";
  var profilePic = "";
}
