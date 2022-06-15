

import 'package:ecommerce2/logic/controllers/auth_visiblaty.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }
  // نقلتها هنا علشان لو عايز استخدمها في اكتر من صفحه واروح استدعيها من الروت بتاعنا

}