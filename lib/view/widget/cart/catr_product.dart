import 'package:ecommerce2/logic/controllers/cart_controller.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_model.dart';

class CartProductCard extends StatelessWidget {
   CartProductCard({Key? key, required this.productModels, required this.index, required this.quantinty}) : super(key: key);
    final ProductModels productModels;
    final int index;
    final int quantinty;

    final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20, top: 10),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color:Get.isDarkMode ? pinkClr.withOpacity(.7) : mainColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15,),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(20),
              image:  DecorationImage(
                image: NetworkImage(productModels.image,),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(productModels.title,
                    style: TextStyle(
                      color:Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                    style: TextStyle(
                      color:Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],)

          ),
          Column(
            children: [
              Row(children: [
                IconButton(onPressed: (){
                  controller.removeProductFromCart(productModels);
                },
                    icon: Icon(Icons.remove_circle,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
                Text('$quantinty',
                  style: TextStyle(
                    color:Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),

                ),
                IconButton(onPressed: (){
                  controller.addProductToCart(productModels);
                },
                    icon: Icon(Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,

                    )),
              ],),
              IconButton(onPressed: (){
                controller.removeOneProductFromCart(productModels);
              },
                  icon: Icon(Icons.delete,
                    size: 20,
                    color: Get.isDarkMode ? Colors.black : Colors.red,
                  ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
