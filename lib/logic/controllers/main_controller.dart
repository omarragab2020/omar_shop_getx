import 'package:ecommerce2/view/screens/fav_screen.dart';
import 'package:ecommerce2/view/screens/home_screen.dart';
import 'package:ecommerce2/view/screens/setting_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/category_screen.dart';

class MainCotroller extends GetxController {
  RxInt currentIndex = 0.obs ;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs ;

  final titles = [
    'Omar Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}