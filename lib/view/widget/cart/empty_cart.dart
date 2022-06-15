import 'package:ecommerce2/routes/routes.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
          size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 40,),
          RichText(text: TextSpan(
            // RichText لو عايز اعمل اكتر من كلمة جمب بعض بالوان مختلفه 
            children: [
              TextSpan(
                text: 'Your Cart is ',
                style: TextStyle(
                  color:Get.isDarkMode?Colors.white :Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                      color:Get.isDarkMode?pinkClr :mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  )
              ),            ]
          )),
          const SizedBox(height: 10,),
          Text('Add Items to get started',
              style: TextStyle(
                  color:Get.isDarkMode?Colors.white :Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              )
          ),
          const SizedBox(height: 50,),
          SizedBox(
            height: 50,
            child: ElevatedButton(onPressed: (){
              Get.toNamed(Routes.mainScreen);
            },

                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                child: const Text('Go to Home',
                    style: TextStyle(
                        color:Colors.white ,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )

                )),
          )

        ],
      ),
    );
  }
}
