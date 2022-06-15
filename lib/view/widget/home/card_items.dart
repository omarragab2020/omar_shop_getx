import 'package:ecommerce2/logic/controllers/product_controller.dart';
import 'package:ecommerce2/model/product_model.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:ecommerce2/view/screens/product_details.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (controller.isLoading.value){
        return  Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      }else {
        return  Expanded(
          child: controller.searchList.isEmpty
              && controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode? Image.asset('assets/images/search_empry_dark.png')
              : Image.asset('assets/images/search_empry_light.png') :

          GridView.builder(
            itemCount: controller.searchList.isEmpty ?
            controller.productList.length:
            controller.searchList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,

            ),

            itemBuilder:(context , index){

              if(controller.searchList.isEmpty){
                return buildCardItems(
                    image: controller.productList[index].image,
                    price: controller.productList[index].price,
                    rate: controller.productList[index].rating.rate,
                    productId:controller.productList[index].id,
                    productModels:controller.productList[index],
                    onTap: (){
                      Get.to(() =>  ProductDetailsScreen(
                        productModels: controller.productList[index],
                      ));
                    }
                );
              }else{
                return buildCardItems(
                    image: controller.searchList[index].image,
                    price: controller.searchList[index].price,
                    rate: controller.searchList[index].rating.rate,
                    productId:controller.searchList[index].id,
                    productModels:controller.searchList[index],
                    onTap: (){
                      Get.to(() =>  ProductDetailsScreen(
                        productModels: controller.searchList[index],
                      ));
                    }
                );
              }

            } ,

          ),
        );
      }
    } );
  }

  Widget buildCardItems({
  required String image,
  required double price,
  required double rate,
  required int productId,
  required ProductModels productModels,
  required Function() onTap,
}){
    return  Padding(padding: const EdgeInsets.all(5),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]
        ),
        child: Column(
          children: [
            Obx(() =>
                Row(
                  // ده اللي فوق اللي فيه الايقون
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      controller.manageFavourites(productId);
                    },
                      icon: controller.isFavorites(productId)

                     ? const Icon(Icons.favorite,
                        color: Colors.red,
                      )
                          :const Icon(Icons.favorite_outline,
                        color: Colors.black,
                      )
                    ),
                    IconButton(onPressed: (){
                      cartController.addProductToCart(productModels);
                    },
                      icon: const Icon(Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
            ),
            Container(
              // ده اللي فيه الصورة
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(image,
              fit: BoxFit.fitHeight,
              ),


            ),
            Padding(
              padding:  const EdgeInsets.only(left: 15,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // هنعمل فيه اللي تحت الصورة
                children:  [
                  Text('\$ $price' ,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.only(left: 4,right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: '$rate',
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          Icon(Icons.star,size: 13,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
    );
  }
}
