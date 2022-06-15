
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widget/font_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              // اعمل ال sized box لو مفيش color لو في هعمل container
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/background.png' , fit: BoxFit.fill,),
            ),
            Container(
              color: Colors.black.withOpacity(.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  const Center(
                        child:
                        TextUtils(
                          text: 'Welcome',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                            underLine: TextDecoration.none,
                        ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                          text: 'Omar', fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          underLine: TextDecoration.none,

                        ),
                        SizedBox(width: 7,),
                        TextUtils(text: 'Shop',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )
                    ),
                      onPressed: (){
                      // ignore: prefer_const_constructors
                      Get.offNamed(Routes.loginScreen);
                      },
                      child: const TextUtils(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: 'GetStart',
                        underLine: TextDecoration.none,
                      )),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                       const TextUtils(
                          text: "Don't have account ? ",
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                         underLine: TextDecoration.none,
                       ),
                      TextButton(onPressed: (){
                        Get.offNamed(Routes.signUpScreen);

                      },
                          child:   const TextUtils(
                              text: "Sign Up",
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            underLine: TextDecoration.underline,
                          ),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
