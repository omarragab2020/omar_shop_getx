import 'package:ecommerce2/utils/theme.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text ;
  final String textType ;
  final Function() onPress;
  const ContainerUnder({Key? key, required this.text, required this.onPress, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.green : pinkClr,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20,),
            topRight: Radius.circular(20,),
        ),
      ),child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        TextUtils(fontSize: 20,
            fontWeight: FontWeight.bold,
            text: text,
            color: Colors.white,
            underLine: TextDecoration.none
        ),
        TextButton(onPressed: onPress,
            child:  TextUtils(fontSize: 20,
                fontWeight: FontWeight.bold,
                text: textType,
                color: Colors.white,
                underLine: TextDecoration.none
            ),
        )
      ],
    ),
    );
  }
}
