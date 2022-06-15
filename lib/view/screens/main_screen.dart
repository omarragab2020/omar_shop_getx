import 'package:badges/badges.dart';
import 'package:ecommerce2/routes/routes.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../logic/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainCotroller>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx((){
          return Scaffold(
            backgroundColor:context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor:Get.isDarkMode ? darkGreyClr : mainColor,
              leading: Container(),
              actions: [

           Obx(() =>  Badge(
               position:  BadgePosition.topEnd(top: 0, end: 3),
               animationDuration: Duration(milliseconds: 300),
               badgeContent: Text(cartController.quantity().toString()),
               animationType: BadgeAnimationType.slide,
               child:   IconButton(onPressed: (){
                 Get.toNamed(Routes.cartScreen);
               },
                   icon: Image.asset('assets/images/shop.png'))
           ) )
              ],
              title: Text(controller.titles[controller.currentIndex.value]),
              centerTitle: true,
            ),

            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr  : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home,
                    color: Get.isDarkMode ?  pinkClr : mainColor ,
                  ),
                  icon: Icon(Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black ,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.category,
                    color: Get.isDarkMode ?  pinkClr : mainColor ,
                  ),
                  icon: Icon(Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black ,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite,
                    color: Get.isDarkMode ?  pinkClr : mainColor ,
                  ),
                  icon: Icon(Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black ,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings,
                    color: Get.isDarkMode ?  pinkClr : mainColor ,
                  ),
                  icon: Icon(Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black ,
                  ),
                  label: '',
                ),
              ],
              onTap: (index){
                controller.currentIndex.value = index ;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        }),
    );
  }
}
