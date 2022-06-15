import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_visiblaty.dart';
import '../../../logic/controllers/setting_controller.dart';
import '../font_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
              () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                     'https://lh3.googleusercontent.com/a-/AOh14GjBGRtJ06qOfU9f1l9JpGbrjKxEnOf_Ap-gQTOJ=s360-p-rw-no',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: controller
                        .capitalize(authController.displayUserName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
