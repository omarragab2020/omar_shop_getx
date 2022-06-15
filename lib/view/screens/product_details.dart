import 'package:ecommerce2/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/product_details/add_card.dart';
import '../widget/product_details/clothes_info.dart';
import '../widget/product_details/image_slider.dart';
import '../widget/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModels}) : super(key: key);

  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModels.image,),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
