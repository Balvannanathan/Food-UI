import 'package:food_ui/Helpers/Navigations/NavigationConfig.dart';
import 'package:food_ui/Pages/SplashScreen/SplashScreenModel.dart';

class SplashScreenVM extends SplashScreenModel {
  void navigateToHomeScreen() {
    pushReplace(NavigationConfig.onboardingScreen);
  }
}
