

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:commerce_module/interface/sources/I_data_process_source.dart';
 import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

import '../interface/sources/I_data_with_upload_source.dart';
import '../utilis/firebase/fireBase_exception_consts.dart';

class ProductRepo  {
  ICommerceSource _inputSource;
  ICommerceUploadSource _uploadSource;
  ProductRepo(    this._inputSource,    this._uploadSource );

  Future<CommerceResult<RemoteBaseModel, dynamic>> addProduct(
      ICommerceBaseDataModel data , File ? file ) async {
    try {
      var result ;
      if (file != null) {
          result = await _uploadSource.addDataRowWithUpload( file , "imagurl " );
        return CommerceResult().data(result);
      } else {
          result = await _inputSource.addDataRow();
        return CommerceResult().data(result);
      }



    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }

  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> deleteProduct(String id) async {
    try {
      var result = await _inputSource.deleteDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, List<ICommerceBaseDataModel>>>
      getAllProducts() async {
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

  Future<CommerceResult<RemoteBaseModel, ICommerceBaseDataModel>> getSingleProduct(
      String id) async {
    try {
      var result = await _inputSource.getDataRow(id);

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> updateProduct(String id ,File? file ) async {
    try {
      var result ;
      if (file != null) {
          result = await _inputSource.updateDataRow(id);
      } else {
        result = await _inputSource.updateDataRow(id);
      }

      return CommerceResult().data(result);
    } on FirebaseException catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: handilExcepstons(e.code), status: e.code));
    }
  }


}
