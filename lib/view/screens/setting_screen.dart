import 'package:ecommerce2/logic/controllers/auth_visiblaty.dart';
import 'package:ecommerce2/logic/controllers/theme_controller.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widget/setting/dark_mode.dart';
import '../widget/setting/language_widget.dart';
import '../widget/setting/log_out.dart';
import '../widget/setting/profile_image.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children:  [
          // ProfileImage(),
          const SizedBox(height: 10,),
          Divider(color:Get.isDarkMode? Colors.white: Colors.grey,
          thickness: 2,
          ),
          const SizedBox(height: 20,),
           TextUtils(
              fontSize: 18,
               fontWeight: FontWeight.bold,
              text: 'GENERAL',
              color: Get.isDarkMode?  pinkClr :mainColor,
              underLine: TextDecoration.none),
          const SizedBox(height: 20,),
           DarkModeWidget(),
          const SizedBox(height: 20,),
          LanguageWidget(),
          const SizedBox(height: 20,),
        LogOutWidget(),

        ],
      ),
    );
  }
}
