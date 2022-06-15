import 'package:ecommerce2/utils/theme.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import '../../../logic/controllers/product_controller.dart';

class ClothesInfo extends StatelessWidget {
  
  final String title;
  final int productId ;
  final double rate;
  final String description;
   ClothesInfo({Key? key, required this.title, required this.productId, required this.rate, required this.description, }) : super(key: key);

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                ),
              ),
              Obx(() =>
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.white.withOpacity(.9) : Colors.grey.withOpacity(.4) ,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        controller.manageFavourites(productId);
                      },
                      child:controller.isFavorites(productId) ?
                      const Icon(Icons.favorite,
                        color: Colors.red,size: 20,
                      )
                      :const Icon(Icons.favorite_outline,
                       color: Colors.black,size: 20,
                     ),
                    ),
                  )

              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: '$rate',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              const SizedBox(
                width: 8,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => Icon(Icons.star, size: 20, color: Colors.orangeAccent),
                itemCount: 5,
                itemSize: 20.0,
              )
            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Shoe Less',
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor ,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor ,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black ,
            ),
          ),
        ],
      ),
    );
  }
}
