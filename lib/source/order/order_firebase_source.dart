import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/constes/collections.dart';
import 'package:commerce_module/interface/sources/I_data_process_source.dart';
import 'package:commerce_module/modele/order/order_model.dart';
import 'package:commerce_module/modele/order/ordered_product_model.dart';
import 'package:commerce_module/utilis/firebase/firebase.dart';
import 'package:commerce_module/utilis/firebase/firestore_inputs.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

import '../../../interface/sources/stream.dart';
import '../../../modele/products/base_models/product_model.dart';

class OrderFirebaseSource
    implements
        ICommerceSource<OrderBaseModel>,
        ICommerceFirebaseStreamSource<OrderBaseModel> {
  late FireStoreAction _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  OrderBaseModel? data;

  OrderFirebaseSource(OrderBaseModel data) {

    _fireStoreAction = FireStoreAction();
    _firebaseLoadingData = FirebaseLoadingData();
    this.data = data;
  }
  @override
  Future<String> addDataRow() {
    return _fireStoreAction.addDataCloudFirestore(
        collection: CollectionsName.prodeuctData, mymap: data!.toJson());
  }

  @override
  Future<void> deleteDataRow(String id) {
    return _fireStoreAction.deleteDataCloudFirestoreOneDocument(
        collection: CollectionsName.prodeuctData, id: id);
  }

  @override
  Future updateDataRow(String id) {
    return _fireStoreAction.editDataCloudFirestore(
        collection: CollectionsName.prodeuctData,
        id: data!.id,
        mymap: data!.toJson());
  }

  @override
  Future<List<OrderBaseModel>> getAllDataList() async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.prodeuctData,
        builder: (data, id) => OrderBaseModel.fromJson(data!, id));
    return product;
  }

  @override
  Future<OrderBaseModel> getDataRow(String id) async {
    var data = await _firebaseLoadingData.loadSingleDocData(
        CollectionsName.prodeuctData, id);
    return OrderBaseModel.fromJson(data!, id);
  }

  @override
  Stream<List<OrderBaseModel>> getAllDataStream() async* {
    // use streamData form _firebaseLoadingData
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.prodeuctData,
        builder: (data, id) => OrderBaseModel.fromJson(data!, id));
  }

  @override
  Stream<OrderBaseModel> getDataRowStream(String id) async* {
    yield* _firebaseLoadingData.streamSingleData(
        path: CollectionsName.prodeuctData,
        builder: (data, id) => OrderBaseModel.fromJson(data!, id));
  }

  @override
  Stream<List<OrderBaseModel>> getDataStream(Query queryData) async* {
    yield* _firebaseLoadingData.StreamDataWithQuery(
        path: CollectionsName.prodeuctData,
        queryBuilder: (query) => queryData,
        builder: (data, id) => OrderBaseModel.fromJson(data!, id));
  }

  @override
  Future<List<OrderBaseModel>> getData(Query query) async {
    var product = await _firebaseLoadingData.loadDataWithQuery(
        path: CollectionsName.prodeuctData,
        queryBuilder: (query) => query.where('id', isEqualTo: data!.id),
        builder: (data, id) => OrderBaseModel.fromJson(data!, id));
    return product;
  }
}
