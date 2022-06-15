import 'package:ecommerce2/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../widget/cart/cart_total.dart';
import '../widget/cart/catr_product.dart';
import '../widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart Items'),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        actions: [
          IconButton(onPressed: (){
            controller.ClearAllProducts();
          },
              icon: Icon(
                Icons.backspace,
              ))
        ],
      ),
      body: Obx((){

        if (controller.productMap.isEmpty){
          return EmptyCart();
        }else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                    itemBuilder: (context , index){
                      return CartProductCard(
                        quantinty: controller.productMap.values.toList()[index],
                        index: index,
                        productModels: controller.productMap.keys.toList()[index],
                      );
                    },
                    separatorBuilder:  (context , index)=>
                    const SizedBox(height: 20,),
                    itemCount: controller.productMap.length,
                  ),
                ),
                Padding(padding: EdgeInsets.only(
                  bottom: 30,
                ),
                  child: CartTotal(),

                )
              ],
            ),
          );

        }
      })
    ),
    );
  }
}
