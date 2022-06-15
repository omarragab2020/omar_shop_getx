import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
    final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if (controller.favouriteList.isEmpty) {
          return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/heart.png'),
              ),
              SizedBox(height: 20,),
              Text('Please , Add your favorites prducts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              ),
            ],
          ),
        );
        }else {
          return ListView.separated(
              itemBuilder: (context,index){
                return buildFavorieItems(
                  image: controller.favouriteList[index].image,
                  title: controller.favouriteList[index].title,
                  price: controller.favouriteList[index].price,
                  productId: controller.favouriteList[index].id,
                );
              },
              separatorBuilder: (context,index){
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favouriteList.length,
          );
        }

      }),

    );
  }

  Widget buildFavorieItems(
   {
     required String image,
     required double price,
     required String title,
     required int productId,

   }
   ){
    return Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children:  [
              SizedBox(
                child:  Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(image,
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis, // لو الكلام كبير يقسم السطر
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white: Colors.black,
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Text('$price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis, // لو الكلام كبير يقسم السطر
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white: Colors.black,
                    ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: (){
                    controller.manageFavourites(productId);
                  },
                  icon: const Icon(Icons.favorite,
                  color: Colors.red,
                    size: 30,
                  ),
              )

            ],
          ),
        ),
    );
  }
}
