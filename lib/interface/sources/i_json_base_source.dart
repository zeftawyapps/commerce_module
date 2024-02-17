

import '../../utilis/models/base_data_model.dart';
import '../../utilis/models/remote_base_model.dart';
import '../../utilis/result/result.dart';

abstract class ICommerceResultBaseCRUDSource<T extends BaseDataModel>   {

  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>> addDataItem();
  Future <CommerceResult<RemoteBaseModel, RemoteBaseModel>> updateDataItem(String id);
  Future <CommerceResult<RemoteBaseModel, RemoteBaseModel>> deleteDataItem(String id);
  Future <CommerceResult<RemoteBaseModel, RemoteBaseModel<List<T>>  >> getDataList();
  Future <CommerceResult<RemoteBaseModel, RemoteBaseModel<T>>> getSingleData(String id);

}
