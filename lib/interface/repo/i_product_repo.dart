
import '../../https/proudecBaseUrls.dart';

 abstract class IRepo<T , p > {

   addProduct(T product);
   updateProduct(T product , String id );
   deleteProduct(String  id);

    getAllProducts();
   getSingleProduct(String id);
   getProducts( p  query);
}