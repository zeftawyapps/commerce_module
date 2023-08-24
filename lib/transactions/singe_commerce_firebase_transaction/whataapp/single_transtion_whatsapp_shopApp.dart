import 'dart:io';

import 'package:commerce_module/modele/order/order_model.dart';

import 'package:commerce_module/modele/order/ordered_product_model.dart';

import 'package:commerce_module/modele/products/base_models/depoartment.dart';

import 'package:commerce_module/modele/products/product_from_dep.dart';
import 'package:commerce_module/reposetory/prodecut_repo.dart';

import 'package:commerce_module/utilis/models/base_model.dart';

import 'package:commerce_module/utilis/result/result.dart';

import '../../../interface/transaction/base_transaction.dart';
import '../../../interface/transaction/castumer_app.dart';
import '../../../interface/transaction/shop_app.dart';
import '../../../reposetory/deprartment_repo.dart';
import '../../../reposetory/order_repo.dart';
import '../../../source/firebase/prodeuct/department_firebase_source.dart';
import '../../../utilis/models/base_data_model.dart';

class SingleTransactionWhatsappCustomerApp extends BaseTransaction
    implements IShopAppTransaction {
  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> addDepartment(
      DepartmentBaseModel department, File? file) async {
    var repo = departmentActions(department);
    var result = await repo.addDeparmentWithUpload(file);
    return CommerceResult(data: department, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> addProduct(
      ProductFromDep product, File? file) async {
   var repo = prodeuctActions(product);
    var result =await   repo.addProduct( product ,   file);
    return CommerceResult(data: product, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> editDepartment(
      String id, DepartmentBaseModel dep , File? file)async {
    DepRepo repo = departmentActions(dep);
    var result =await  repo.updateDeparmentWithUpload(id , file);
    return CommerceResult(data: dep, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> editProduct(
      ProductFromDep product,String id ,  File? file) async {
    var repo = prodeuctActions(product);
    var result =await  repo.updateProduct(id ,  file);
    return CommerceResult(data: product, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>>
      removeAllProductsFromDepartment(  ProductFromDep prduct ,    String departmentId) {
    // TODO: implement removeDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> removeDepartment(
      DepartmentBaseModel department)async  {
 var repo = departmentActions(department);
    var result = await repo.deleteDepartment(department.id! );
    return CommerceResult(data: department, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> removeProduct(
      ProductFromDep product) {
    // TODO: implement removeProduct
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>>
      removeProductFromDepartment(String departmentId, ProductFromDep product) async{
  var repo = prodeuctActions(product);
    var result = await  repo.deleteProduct(departmentId);
    return CommerceResult(data: product, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<DepartmentBaseModel>>> getAllDepartment() async  {
    var repo = departmentActions(null);
var result =   await   repo.getAllDepartment();
   return CommerceResult(data: result.data, error: result.error);
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> getDepartment(DepartmentBaseModel id) {
    // TODO: implement getDepartment
    throw UnimplementedError();
  }
}
