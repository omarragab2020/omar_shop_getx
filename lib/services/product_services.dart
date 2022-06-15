import 'package:ecommerce2/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';
class ProductServices {
  
 static Future <List<ProductModels>>  getProduct() async{

  var response = await http.get(Uri.parse('$baseUrl/products'));
    // بعمل ال api في متغير علشان لو ال domain بتاع المشروع اتغير بعد كده اعدل في المتغير علي طول
    if(response.statusCode == 200) {
      // النتيجة اللي جاية من api سجلتها في متغير اسمه response بعد كده جبت ال body اللي هو فيه الكلام بتاع JSON
     var jsonData = response.body;
     return productModelsFromJson(jsonData);
    }else{
      return throw Exception(
        'Failed to load product'
      );
    }

  }
}