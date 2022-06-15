import 'dart:ui';

import 'package:ecommerce2/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce2/model/product_model.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {


  var productMap = {}.obs ;

  void addProductToCart(ProductModels productModels) {

    if (productMap.containsKey(productModels)){

      productMap[productModels] += 1;
      // لو الحاجه اتكررت ضيفها
     // reduce بتجمع كل القيم مع بعض

    }else{
      productMap[productModels] = 1;
      // لو المفتاح موجود ضيف العنصر مره واحده

    }
  }


  void removeProductFromCart(ProductModels productModels) {
    if(productMap.containsKey(productModels)
        && productMap[productModels] ==1){
      productMap.removeWhere((key, value) => key ==productModels );
    }else {
      productMap[productModels] -= 1;
    }

  }


  void removeOneProductFromCart(ProductModels productModels ) {
    productMap.removeWhere((key, value) => key ==productModels );

  }


  void ClearAllProducts() {
    Get.defaultDialog(
      title: "Clear Products",
      titleStyle:  const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();

      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );

  }

  get productSubTotal => productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries.map((e) =>
  e.key.price * e.value).toList().reduce((value, element) =>
  value + element).toStringAsFixed(2);


  int quantity () {
    if(productMap.isEmpty){
      return 0;
    }
    else {

      return productMap.entries.map((e) => e.value).toList()
          .reduce((value, element) => value + element);
    }
  }


}