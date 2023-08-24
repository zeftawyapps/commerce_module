import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:commerce_module/interface/sources/I_data_process_source.dart';
import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

import '../utilis/firebase/fireBase_exception_consts.dart';

class   CommerceBaseRepo{
  ICommerceSource _inputSource;

  CommerceBaseRepo(this._inputSource);

  Future<CommerceResult<RemoteBaseModel, dynamic>> addData(
      ICommerceBaseDataModel data  ) async {
    try {
      var result = await _inputSource.addDataRow(  );

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }

  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> deleteData(String id) async {
    try {
      var result = await _inputSource.deleteDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>>
  getAllData() async {
    try {
      var result =
      await _inputSource.getAllDataList() as List<ICommerceBaseDataModel>;

      return CommerceResult.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>> getProducts(
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

  Future<CommerceResult<RemoteBaseModel, ICommerceBaseDataModel>> getSingleData(
      String id) async {
    try {
      var result = await _inputSource.getDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> updateData(String id  ) async {
    try {
      var result = await _inputSource.updateDataRow(id,  );

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }


}
