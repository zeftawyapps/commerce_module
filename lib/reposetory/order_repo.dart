import 'package:cloud_firestore/cloud_firestore.dart';

import '../interface/sources/I_data_process_source.dart';
import '../utilis/firebase/fireBase_exception_consts.dart';
import '../utilis/models/base_data_model.dart';
import '../utilis/models/base_model.dart';
import '../utilis/result/result.dart';

class OrderRepo {
  ICommerceSource _inputSource;

  OrderRepo(this._inputSource);

  Future<CommerceResult<RemoteBaseModel, dynamic>> addOrder(
      ICommerceBaseDataModel order ) async {
    try {
      var result = await _inputSource.addDataRow(  );

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }

  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> deleteOrder(String id) async {
    try {
      var result = await _inputSource.deleteDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>>
  getAllOrder() async {
    try {
      var result =
      await _inputSource.getAllDataList() as List<ICommerceBaseDataModel>;

      return CommerceResult.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>> getOrder(
      query) async {
    try {
      var result =
      await _inputSource.getData(query) as List<ICommerceBaseDataModel>;

      return CommerceResult.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, ICommerceBaseDataModel>> getSingleOrder(
      String id) async {
    try {
      var result = await _inputSource.getDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> updateOrder(String id) async {
    try {
      var result = await _inputSource.updateDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

}