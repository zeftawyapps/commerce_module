import 'dart:io';

import 'package:commerce_module/modele/order/ordered_product_model.dart';

import '../../modele/products/base_models/depoartment.dart';
import '../../modele/products/product_from_dep.dart';
import '../../utilis/models/base_model.dart';
import '../../utilis/result/result.dart';

abstract class IShopAppTransaction{
  Future <CommerceResult<RemoteBaseModel , List<DepartmentBaseModel>> > getAllDepartment( );
  Future <CommerceResult<RemoteBaseModel , DepartmentBaseModel> > getDepartment(DepartmentBaseModel id );

  Future <CommerceResult<RemoteBaseModel , ProductFromDep> > addProduct(ProductFromDep product, File? file);
  Future <CommerceResult<RemoteBaseModel , ProductFromDep> > editProduct(ProductFromDep product , String id  , File? file);
   Future <CommerceResult<RemoteBaseModel , DepartmentBaseModel> > addDepartment(DepartmentBaseModel department, File? file);
  Future <CommerceResult<RemoteBaseModel , DepartmentBaseModel> > editDepartment(String id ,DepartmentBaseModel dep , File? file);
  Future <CommerceResult<RemoteBaseModel , DepartmentBaseModel> > removeDepartment(DepartmentBaseModel department);
  Future <CommerceResult<RemoteBaseModel , ProductFromDep> > removeProductFromDepartment(String departmentId , ProductFromDep product);

}

abstract class   IShopAppOrderTransaction{
  Future <CommerceResult<RemoteBaseModel , List<OrderedProductModel>> > getProductsFromOrder( String orderId);
// get order data
 Future <CommerceResult<RemoteBaseModel , List<OrderedProductModel>> > getAllOrders();

  Future <CommerceResult<RemoteBaseModel , List<OrderedProductModel>> > getOrdersFromUser(String userId);
  Future <CommerceResult<RemoteBaseModel , OrderedProductModel>  > getOrderData(String orderId);
// send order to user
  Future <CommerceResult<RemoteBaseModel , OrderedProductModel>  > sendOrderToUser(String orderId);
  // send money to shope
  Future <CommerceResult<RemoteBaseModel , OrderedProductModel>  > sendMoneyToShop(String orderId);
}