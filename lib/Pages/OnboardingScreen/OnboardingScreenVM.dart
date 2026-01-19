import 'package:food_ui/Helpers/Navigations/NavigationConfig.dart';
import 'package:food_ui/Pages/OnboardingScreen/OnboardingScreenModel.dart';

class OnboardingScreenVM extends OnboardingScreenModel {

  void navigateToLoginScreen() {
    pushReplace(NavigationConfig.loginScreen);
  }
}
