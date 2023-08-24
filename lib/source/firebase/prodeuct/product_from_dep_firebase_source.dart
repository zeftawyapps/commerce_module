import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/constes/collections.dart';
import 'package:commerce_module/interface/sources/I_data_process_source.dart';
import 'package:commerce_module/interface/sources/I_data_with_upload_source.dart';
import 'package:commerce_module/modele/products/base_models/product_model.dart';
import 'package:commerce_module/modele/products/product_from_dep.dart';
import 'package:commerce_module/utilis/firebase/firebase.dart';
import 'package:commerce_module/utilis/firebase/firebase_and_storage_action.dart';
import 'package:commerce_module/utilis/firebase/firestore_inputs.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

import '../../../interface/sources/stream.dart';

class ProductFromDepFirebaseSource
    implements
        ICommerceSource<ProductFromDep>,
        ICommerceFirebaseStreamSource<ProductFromDep>
, ICommerceUploadSource
{
  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  ProductFromDep? data;


  ProductFromDepFirebaseSource(ProductFromDep? product) {
    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
    this.data = product;
  }
  @override
  Future<String> addDataRow() {
    String docId = data!.depId;
    return _fireStoreAction.addDataCloudFirestoreSupCollection(
        collection: CollectionsName.departmentData,
        docId: docId,
        subCollection: CollectionsName.prodeuctData,
        mymap: data!.toJson());
  }

  @override
  Future<void> deleteDataRow(String id) {
    return _fireStoreAction.deleteDataCloudFirestoreOneDocumentSubCollection(
        docId: data!.depId,
        collection: CollectionsName.departmentData,
        subCollection: CollectionsName.prodeuctData,
        id: id);
  }

  @override
  Future updateDataRow(String id) {
    String docId = data!.depId;
    return _fireStoreAction.editDataCloudFirestoreSubColletion(
        collection: CollectionsName.departmentData,
        subCollection: CollectionsName.prodeuctData,
        docId: docId,
        id: data!.id,
        mymap: data!.toJson());
  }

  @override
  Future<List<ProductFromDep>> getAllDataList() async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.departmentData +
            "/" +
            data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        builder: (data, id) => ProductFromDep.fromJson(data!, id));
    return product;
  }

  @override
  Future<ProductFromDep> getDataRow(String id) async {
    var data = await _firebaseLoadingData.loadSingleDocData(
        CollectionsName.departmentData +
            "/" +
            this.data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        id);
    return ProductFromDep.fromJson(data!, id);
  }

  @override
  Stream<List<ProductFromDep>> getAllDataStream() async* {
    // use streamData form _firebaseLoadingData
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.departmentData +
            "/" +
            data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        builder: (data, id) => ProductFromDep.fromJson(data!, id));
  }

  @override
  Stream<ProductFromDep> getDataRowStream(String id) async* {
    yield* _firebaseLoadingData.streamSingleData(
        path: CollectionsName.departmentData +
            "/" +
            data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        builder: (data, id) => ProductFromDep.fromJson(data!, id));
  }

  @override
  Stream<List<ProductFromDep>> getDataStream(Query queryData) async* {
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.departmentData +
            "/" +
            data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        queryBuilder: (query) => queryData,
        builder: (data, id) => ProductFromDep.fromJson(data!, id));
  }

  @override
  Future<List<ProductFromDep>> getData(Query query) async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.departmentData +
            "/" +
            data!.depId +
            "/" +
            CollectionsName.prodeuctData,
        queryBuilder: (query) => query.where('id', isEqualTo: data!.id),
        builder: (data, id) => ProductFromDep.fromJson(data!, id));
    return product;
  }

  @override
  Future addDataRowWithUpload(File? file, String? imagfileld) {
    String docId = data!.depId;

    return _fireStoreAction.addDataCloudFirestorWithUploadSubCollection(
        collection: CollectionsName.departmentData,
        subcollection: CollectionsName.prodeuctData,
        docId: docId,
        file: file,
        imageField:imagfileld ,
        id: data!.id,
        mymap: data!.toJson());
  }

  @override
  Future updateDataRowWithUplaod(String id, File? file, String? imagfileld) {
    String docId = data!.depId;
    return _fireStoreAction.editeDataCloudFirestorWithUploadSubCollection(
        collection: CollectionsName.departmentData,
        subcollection: CollectionsName.prodeuctData,
        docId: docId,
        file: file,
        image:imagfileld ,
        id: data!.id,
        mymap: data!.toJson());
  }

  @override
  Future updateDataRowWithUplaodRepcament(String id, File? file, String? imagfileld) {
    String docId = data!.depId;
    return _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacementSubCollection(
        collection: CollectionsName.departmentData,
        subcollection: CollectionsName.prodeuctData,
        docid: docId,
        file: file,
        iamgeField:imagfileld ,
        id: data!.id,
        mymap: data!.toJson());
  }
  }

