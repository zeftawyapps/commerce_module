

import '../../modele/order/order_model.dart';
import '../../modele/products/base_models/depoartment.dart';
import '../../modele/products/product_from_dep.dart';
import '../../reposetory/deprartment_repo.dart';
import '../../reposetory/order_repo.dart';
import '../../reposetory/prodecut_repo.dart';
import '../../source/firebase/prodeuct/department_firebase_source.dart';
import '../../source/firebase/prodeuct/product_from_dep_firebase_source.dart';
import '../../source/order/order_firebase_source.dart';
import '../../utilis/models/base_data_model.dart';

abstract class BaseTransaction {


  late DepRepo _depRepo;
  late ProductRepo _product;
  late OrderRepo _orderRepo;


  DepRepo departmentActions(DepartmentBaseModel? departmant) {
    var _uploadSource = DepartmentFirebaseSource(departmant);
    var _inputSource = DepartmentFirebaseSource(departmant);
    _depRepo = DepRepo(_inputSource, _uploadSource);
    return _depRepo;
  }

  ProductRepo prodeuctActions(ProductFromDep?  data ) {
    var _uploadSource = ProductFromDepFirebaseSource(data);
    var _inputSource = ProductFromDepFirebaseSource(data);
    _product = ProductRepo(_inputSource, _uploadSource);
    return _product;
  }

  OrderRepo orderActions(ICommerceBaseDataModel order) {
    var inputs = OrderFirebaseSource(order as OrderBaseModel);
    _orderRepo = OrderRepo(inputs);
    return _orderRepo;
  }

}

