import 'package:ecommerce2/logic/controllers/main_controller.dart';
import 'package:ecommerce2/logic/controllers/setting_controller.dart';
import 'package:ecommerce2/view/screens/payment_screen.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainCotroller());
    Get.put(SettingController());
    Get.put(PayMentScreen(),permanent: true) ;

  }
}