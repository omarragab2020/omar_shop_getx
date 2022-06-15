import 'package:ecommerce2/model/product_model.dart';
import 'package:ecommerce2/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {

  var productList = <ProductModels>[].obs;
  var favouriteList = <ProductModels>[].obs;
  // عملت .obs علشان دي stream والبيانات بتتحدث علي طول
  //ProductModels بعمل list فاضيه بتجيب البيانات بتاعتها من
  var storage = GetStorage(); // هحفظ العناصر اللي عملتها favourite علشان لما اقفل وافتح تاني يبقوا موجودين
  var isLoading = true.obs;


  //search

  var searchList = <ProductModels> [].obs;
  TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getProducts();
    //  initState  زي
    List? storedShoppings =storage.read<List>('isFavouritesList');
    if(storedShoppings != null){
      favouriteList = storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
  }
  void getProducts() async{

    var products = await ProductServices.getProduct();
    // بجيب الميثود اللي انا عملتها استدعيها هنا
    try{
      isLoading(true);
      if(products.isNotEmpty) {
           productList.addAll(products);
           // لو النتيجة مش فاضية اضيف البيانات في ال list

      }
    }finally{
      // finally بتقولي بعد ما يخلص يعمل اي
      isLoading(false );

    }
  }


  // Logic For Favourite Screen

  void manageFavourites (int productId)async {


    var exitingIndex =  favouriteList.indexWhere((element) => element.id == productId); // بيجيب ال index بتاع العنصر
    if(exitingIndex >= 0 ){
      favouriteList.removeAt(exitingIndex);
      await storage.remove('isFavouritesList');
    }else{
      // بعمل بحث علشان اجيب ال id بتاع العنصر علشان اتحكم في العنصر الواحد
      favouriteList.add(
          productList.firstWhere((element) => element.id == productId));

     await storage.write('isFavouritesList', favouriteList );
    }


  }

  bool isFavorites(int productId) {
    // بتشوف ال id متشابه ولا لا
      return favouriteList.any((element) => element.id == productId);
  }


  // Search Bar LOGIC

  void addSearchToList(String searchName) {

    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName )||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearchFromList() {
    searchTextController.clear();
    addSearchToList('');
  }
}