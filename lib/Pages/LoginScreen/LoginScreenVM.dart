import 'package:food_ui/Helpers/Navigations/NavigationConfig.dart';
import 'package:food_ui/Pages/LoginScreen/LoginScreenModel.dart';

class LoginScreenVM extends LoginScreenModel {
  void navigateToHomeScreen() {
    pushReplace(NavigationConfig.homeScreen);
  }
}
