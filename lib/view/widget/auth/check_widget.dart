import 'package:ecommerce2/logic/controllers/auth_visiblaty.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get.dart';
class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,

              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                  ?  Image.asset('assets/images/check.png')
                  : const Icon(
                Icons.done,size: 30,
                color: pinkClr,
              )
                  : Container(),
            ),
          ),
          SizedBox(width: 10,),
          Row(children: [
            TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "I accept ",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "terms & condition",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.underline),
          ],)
        ],
      );
    });
  }
}
