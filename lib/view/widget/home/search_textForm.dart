import 'package:ecommerce2/logic/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFromText extends StatelessWidget {
   SearchFromText({Key? key}) : super(key: key);

   final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_)
    => TextField(
      controller: controller.searchTextController,
      cursorColor: Colors.black, // لون الخط بتاع تكست فورم
      keyboardType: TextInputType.text,
      onChanged: (searchName){
        controller.addSearchToList(searchName);
      },
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search,
          color: Colors.grey,
        ),
        suffixIcon:  controller.searchTextController.text.isNotEmpty ?
        IconButton(
          onPressed: (){
            controller.clearSearchFromList();
          },
          icon: const Icon(Icons.close,
            color: Colors.black,
          ),

        ) : null,
        hintText: "Search you're looking for",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true, // بتعمل الخلفيه
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    )
    );
  }
}
