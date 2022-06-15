import 'package:ecommerce2/logic/controllers/cart_controller.dart';
import 'package:ecommerce2/logic/controllers/category_controller.dart';
import 'package:ecommerce2/logic/controllers/product_controller.dart';
import 'package:ecommerce2/view/screens/category_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ProductBiding extends Bindings {
  @override
  void dependencies() {

    Get.put(ProductController());
    //put بتشتغل اول لما البرنامج بيتفتح
    Get.lazyPut(() => CartController() );
    // lazyPut بتشتغل لما اضغط انا عليها
    Get.put(CategoryController());
  }
}