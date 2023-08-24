import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:commerce_module/interface/sources/I_data_process_source.dart';
import 'package:commerce_module/modele/products/base_models/depoartment.dart';
 import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

import '../interface/sources/I_data_with_upload_source.dart';
import '../utilis/firebase/fireBase_exception_consts.dart';

class DepRepo  {
  ICommerceSource _inputSource;
  ICommerceUploadSource _uploadSource;
  DepRepo(this._inputSource , this._uploadSource);

  Future<CommerceResult<RemoteBaseModel, String >> addDepartment(
      ICommerceBaseDataModel product   ) async {
    try {
      var result = await _inputSource.addDataRow(   );

      return CommerceResult.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }

  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> deleteDepartment(String id) async {
    try {
      var result = await _inputSource.deleteDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<DepartmentBaseModel>>>
      getAllDepartment() async {
    try {
      var result =
          await _inputSource.getAllDataList() as List<DepartmentBaseModel>;

      return CommerceResult.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>> getDepartment(
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

  Future<CommerceResult<RemoteBaseModel, ICommerceBaseDataModel>> getSingleDepartment(
      String id) async {
    try {
      var result = await _inputSource.getDataRow(id);

      return CommerceResult<RemoteBaseModel, ICommerceBaseDataModel>.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> updateDeparment(String id ) async {
    try {
      var result = await _inputSource.updateDataRow(id  );

      return CommerceResult<RemoteBaseModel, dynamic>.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }
  Future<CommerceResult<RemoteBaseModel, dynamic>> updateDeparmentWithUpload(String id , File? file  ) async {
    try {
      var result ;

      if (file == null) {
        result = await _inputSource.updateDataRow(id  );
      }else{
        result = await _uploadSource.updateDataRowWithUplaod(id , file , "image" );
      }

      return CommerceResult <RemoteBaseModel, dynamic>.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }


  Future<CommerceResult<RemoteBaseModel, String >> addDeparmentWithUpload(  File? file  ) async {
    try {
      var result ;

      if (file == null) {
        result = await _inputSource.addDataRow(  );
      }else{
        result = await _uploadSource.addDataRowWithUpload(  file , "image" );
      }

      return CommerceResult<RemoteBaseModel, String >.data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

}