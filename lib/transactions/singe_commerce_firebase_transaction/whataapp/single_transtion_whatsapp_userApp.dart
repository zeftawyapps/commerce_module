import 'dart:io';

import 'package:commerce_module/modele/order/order_model.dart';

import 'package:commerce_module/modele/order/ordered_product_model.dart';

import 'package:commerce_module/modele/products/base_models/depoartment.dart';

import 'package:commerce_module/modele/products/product_from_dep.dart';

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
    implements ICustomerAppTransactions {
  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> addProdertToCard(ProductFromDep product, int quantity) {
    // TODO: implement addProdertToCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> editProdertToCard(ProductFromDep product, int quantity) {
    // TODO: implement editProdertToCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<DepartmentBaseModel>>> getAllDepartment() {
    // TODO: implement getAllDepartment
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, List<ProductFromDep>>> getAllProducts() {
    // TODO: implement getAllProducts
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
  Future<CommerceResult<RemoteBaseModel, OrderedProductModel>> removeProdertFromCard(OrderedProductModel product) {
    // TODO: implement removeProdertFromCard
    throw UnimplementedError();
  }

  @override
  Future<CommerceResult<RemoteBaseModel, OrderBaseModel>> sendOrderToShope(List<OrderedProductModel> product) {
    // TODO: implement sendOrderToShope
    throw UnimplementedError();
  }

}
