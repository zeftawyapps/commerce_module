import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/interface/transaction/base_transaction.dart';
import 'package:commerce_module/interface/transaction/castumer_app.dart';
import 'package:commerce_module/modele/order/ordered_product_model.dart';
import 'package:commerce_module/modele/products/base_models/depoartment.dart';
import 'package:commerce_module/reposetory/commerce_firebase_repo.dart';
import 'package:commerce_module/reposetory/deprartment_repo.dart';
import 'package:commerce_module/reposetory/prodecut_repo.dart';
import 'package:commerce_module/source/firebase/prodeuct/department_firebase_source.dart';
import 'package:commerce_module/source/firebase/prodeuct/product_from_dep_firebase_source.dart';

import '../../interface/transaction/shop_app.dart';
import '../../modele/order/order_model.dart';
import '../../modele/products/product_from_dep.dart';
import '../../reposetory/order_repo.dart';
import '../../source/order/order_firebase_source.dart';
import '../../utilis/firebase/fireBase_exception_consts.dart';
import '../../utilis/models/base_data_model.dart';
import '../../utilis/models/base_model.dart';
import '../../utilis/result/result.dart';

class SingleCommreceTransactionSrevice extends BaseTransaction     implements ICustomerAppTransactions , IShopAppTransaction , IShopAppOrderTransaction {
  @override
  SingleCommreceTransactionSrevice() {

  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> addDepartment(DepartmentBaseModel department, File? file) {
    // TODO: implement addDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> addProdertToCard(ProductFromDep product, int quantity) {
    // TODO: implement addProdertToCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> addProduct(ProductFromDep product, File? file) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> editDepartment(String  id,DepartmentBaseModel dep  , File? file) {
    // TODO: implement editDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> editProdertToCard(ProductFromDep product, int quantity) {
    // TODO: implement editProdertToCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> editProduct(ProductFromDep product,String id ,  File? file) {
    // TODO: implement editProduct
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<DepartmentBaseModel>>> getAllDepartment() {
    // TODO: implement getAllDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<OrderedProductModel>>> getAllOrders() {
    // TODO: implement getAllOrders
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<ProductFromDep>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> getOrderData(String orderId) {
    // TODO: implement getOrderData
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<OrderedProductModel>>> getOrdersFromUser(String userId) {
    // TODO: implement getOrdersFromUser
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> getProdeuct(String Id) {
    // TODO: implement getProdeuct
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<ProductFromDep>>> getProdeuctsFromDep(String depId) {
    // TODO: implement getProdeuctsFromDep
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<OrderedProductModel>>> getProductsFromOrder(String orderId) {
    // TODO: implement getProductsFromOrder
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> removeAllProductsFromDepartment(   ProductFromDep prduct ,   String departmentId) {
    // TODO: implement removeAllProductsFromDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> removeDepartment(DepartmentBaseModel department) {
    // TODO: implement removeDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> removeProdertFromCard(OrderedProductModel product) {
    // TODO: implement removeProdertFromCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> removeProduct(ProductFromDep product) {
    // TODO: implement removeProduct
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, ProductFromDep>> removeProductFromDepartment(String departmentId, ProductFromDep product) {
    // TODO: implement removeProductFromDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> sendMoneyToShop(String orderId) {
    // TODO: implement sendMoneyToShop
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderBaseModel>> sendOrderToShope(List<OrderedProductModel> product) {
    // TODO: implement sendOrderToShope
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> sendOrderToUser(String orderId) {
    // TODO: implement sendOrderToUser
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, DepartmentBaseModel>> getDepartment(DepartmentBaseModel id) {
    // TODO: implement getDepartment
    throw UnimplementedError();
  }




}
