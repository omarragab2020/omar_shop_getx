import 'package:ecommerce2/logic/binding/main_binding.dart';
import 'package:ecommerce2/logic/binding/product_binding.dart';
import 'package:ecommerce2/view/screens/payment_screen.dart';
import 'package:get/get.dart';

import '../logic/binding/auth_binding.dart';
import '../view/screens/auth/forget_pass.dart';
import '../view/screens/auth/login.dart';
import '../view/screens/auth/sign_up.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  static const mainSreen = Routes.mainScreen;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () =>  WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBiding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBiding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBiding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
