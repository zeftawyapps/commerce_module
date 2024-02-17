import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/utilis/models/remote_base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';
import '../../constes/collections.dart';
import '../../interface/sources/i_base_source.dart';
import '../../interface/sources/i_json_base_source.dart';
import '../../model/quiz/depratment.dart';
import '../../model/services/catigory.dart';
import '../../utilis/firebase/firebase.dart';
import '../../utilis/firebase/firebase_and_storage_action.dart';
import '../../utilis/models/base_data_model.dart';
import '../../utilis/models/staus_model.dart';

class FirebaseCRUDSource
    implements ICommerceResultBaseCRUDSource<BaseDataModel> {
  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  BaseDataModel? data;
  Uint8List? file;
  String imagfileld = "image";
  String collectionName = CollectionsName.categoryData;
  Query? query;
  FirebaseCRUDSource() {
    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
  }
  factory FirebaseCRUDSource.inputs(CategoryOfService? dataModuel,
      {Uint8List? filetoUpload, Query? query}) {
    return FirebaseCRUDSource()
      ..data = dataModuel
      ..file = filetoUpload
      ..query = query
      ..imagfileld = "image";
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>> addDataItem() async {
    var result;
    try {
      if (file != null) {
        result = await _fireStoreAction.addDataCloudFirestorWithUpload(
            file: file!,
            collection: collectionName,
            filedowloadurifieldname: imagfileld!,
            mymap: data!.toJson());
      } else {
        result = await _fireStoreAction.addDataCloudFirestore(
            path: collectionName, mymap: data!.toJson());
      }
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.data(result);
    } on Exception catch (e) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>> deleteDataItem(
      String id) async {
    var result;
    try {
      if (file != null) {
        await _fireStoreAction.deleteDataCloudFirestorWithdeletFile(
            path: collectionName, id: id, oldurl: data!.map![imagfileld]!);
      } else {
        await _fireStoreAction.deleteDataCloudFirestoreOneDocument(
            path: collectionName, id: id);
      }
      result = RemoteBaseModel(message: "Deleted", status: StatusModel.success);
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.data(result);
    } on Exception catch (e) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel<List<BaseDataModel>>>>
      getDataList()async  {
    try {
      var result;
      if (query != null) {
      result = await     _firebaseLoadingData.loadDataWithQuery<BaseDataModel>(
            path: collectionName,
            builder: (data, id) => BaseDataModel.fromJson(data!),
            queryBuilder: (query) => query);
      } else {
        result = await     _firebaseLoadingData.loadDataWithQuery<BaseDataModel>(
            path: collectionName,
            builder: (data, id) => BaseDataModel.fromJson(data!),);
      }
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<List<BaseDataModel>>>.data(result);
    } on Exception catch (e) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<List<BaseDataModel>>>.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }


  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>>
      getSingleData(String id) async {
    try {
      var data = await _firebaseLoadingData.loadSingleDocData(
          collectionName, id);
      var result = BaseDataModel.fromJson(data!);
      var dataresult  = RemoteBaseModel<BaseDataModel>(
          data: result, status: StatusModel.success);
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>.data(dataresult);
    } on Exception catch (e) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }

  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>> updateDataItem(
      String id)async  {
    var result;
    try {
      if (file == null) {
        await  _fireStoreAction.editDataCloudFirestore(
            path: collectionName, id: id, mymap: data!.toJson());
      } else {
       await   _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
            file: file!,
            filedowloadurifieldname: imagfileld,
            collection: collectionName,
            oldurl: data!.map![imagfileld]!,
            id: id,
            mymap: data!.toJson());
      }
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.data(result);
    } on Exception catch (e) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }
}
