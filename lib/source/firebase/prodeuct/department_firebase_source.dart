import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/constes/collections.dart';
import 'package:commerce_module/interface/sources/I_data_process_source.dart';
import 'package:commerce_module/interface/sources/I_data_with_upload_source.dart';
import 'package:commerce_module/modele/products/base_models/depoartment.dart';
import 'package:commerce_module/utilis/firebase/firebase.dart';
import 'package:commerce_module/utilis/firebase/firebase_and_storage_action.dart';
import 'package:commerce_module/utilis/firebase/firestore_inputs.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

 import '../../../interface/sources/stream.dart';

class DepartmentFirebaseSource
    implements
        ICommerceSource<DepartmentBaseModel>,
        ICommerceFirebaseStreamSource<DepartmentBaseModel>
,
        ICommerceUploadSource<DepartmentBaseModel>
{
  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  DepartmentBaseModel? data;

  DepartmentFirebaseSource(DepartmentBaseModel? data) {
    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
    this.data = data ;
  }

  @override
  Future<String> addDataRow() {
    return _fireStoreAction.addDataCloudFirestore(
        collection: CollectionsName.departmentData, mymap: data!.toJson());
  }

  @override
  Future<void> deleteDataRow(String id) {
    return _fireStoreAction.deleteDataCloudFirestoreOneDocument(
        collection: CollectionsName.departmentData, id: id);
  }

  @override
  Future updateDataRow(String id) {
    return _fireStoreAction.editDataCloudFirestore(
        collection: CollectionsName.departmentData,
        id: data!.id!,
        mymap: data!.toJson());
  }

  @override
  Future<List<DepartmentBaseModel>> getAllDataList() async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.departmentData,
        builder: (data, id) => DepartmentBaseModel.fromJson(data!, id));
    return product;
  }

  @override
  Future<DepartmentBaseModel> getDataRow(String id) async {
    var data = await _firebaseLoadingData.loadSingleDocData(
        CollectionsName.departmentData, id);
    return DepartmentBaseModel.fromJson(data!, id);
  }

  @override
  Stream<List<DepartmentBaseModel>> getAllDataStream() async* {
    // use streamData form _firebaseLoadingData
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.departmentData,
        builder: (data, id) => DepartmentBaseModel.fromJson(data!, id));
  }

  @override
  Stream<DepartmentBaseModel> getDataRowStream(String id) async* {
    yield* _firebaseLoadingData.streamSingleData(
        path: CollectionsName.prodeuctData,
        builder: (data, id) => DepartmentBaseModel.fromJson(data!, id));
  }

  @override
  Stream<List<DepartmentBaseModel>> getDataStream(Query queryData) async* {
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.departmentData,
        queryBuilder: (query) => queryData,
        builder: (data, id) => DepartmentBaseModel.fromJson(data!, id));
  }

  @override
  Future<List<DepartmentBaseModel>> getData(Query<Object?> query) async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.departmentData,
        queryBuilder: (query) => query.where('id', isEqualTo: data!.id),
        builder: (data, id) => DepartmentBaseModel.fromJson(data!, id));
    return product;
  }



  @override
  Future<String> addDataWithFile(String id, File? file)async {
    return _fireStoreAction.editeDataCloudFirestorWithUpload(
      file: file!,
        collection: CollectionsName.departmentData,
        id: data!.id!,
        mymap: data!.toJson()).toString();
  }

  @override
  Future<String> updateDataWithFile(String id, File? file)async {
    return _fireStoreAction.addDataCloudFirestorWithUpload(
        file: file!,
        collection: CollectionsName.departmentData,
        id: data!.id,
        mymap: data!.toJson()).toString();
  }

  @override
  Future addDataRowWithUpload(File? file, String? imagfileld)async {
    return _fireStoreAction.addDataCloudFirestorWithUpload(
        file: file!,
        collection: CollectionsName.departmentData,
        id: data!.id,
        filedowloadurifieldname: imagfileld!,
        mymap: data!.toJson()) ;
  }

  @override
  Future updateDataRowWithUplaod(String id, File? file, String? imagfileld)async {
    return _fireStoreAction.editeDataCloudFirestorWithUpload(
        file: file!,
        collection: CollectionsName.departmentData,
        id: data!.id!,
        filedowloadurifieldname: imagfileld!,
        mymap: data!.toJson()) ;
  }

  @override
  Future updateDataRowWithUplaodRepcament(String id, File? file, String? imagfileld) async {
    return _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        file: file!,
        collection: CollectionsName.departmentData,
        id: data!.id!,
        filedowloadurifieldname: imagfileld!,
        mymap: data!.toJson()) ;
  }
}




