import 'package:commerce_module/modele/order/order_model.dart';
import 'package:commerce_module/modele/order/ordered_product_model.dart';
import 'package:commerce_module/modele/products/base_models/depoartment.dart';

import '../../modele/products/product_from_dep.dart';
import '../../utilis/models/base_model.dart';
import '../../utilis/result/result.dart';

abstract class  ICustomerAppTransactions{

  Future <CommerceResult<RemoteBaseModel , OrderedProductModel> > addProdertToCard(ProductFromDep product , int quantity );
  Future <CommerceResult<RemoteBaseModel , OrderedProductModel> > editProdertToCard(ProductFromDep product , int quantity );
  Future  <CommerceResult<RemoteBaseModel , OrderedProductModel> >  removeProdertFromCard(OrderedProductModel product);
  Future<CommerceResult<RemoteBaseModel , List<ProductFromDep> >>  getAllProducts();
  Future <CommerceResult<RemoteBaseModel ,  List<ProductFromDep> > > getProdeuctsFromDep(String depId);
  Future <CommerceResult<RemoteBaseModel ,   ProductFromDep> >   getProdeuct  (String  Id  );
  Future<CommerceResult<RemoteBaseModel ,  List<DepartmentBaseModel> > >  getAllDepartment();
  Future <CommerceResult<RemoteBaseModel ,   OrderBaseModel > > sendOrderToShope( List<OrderedProductModel> product);
}