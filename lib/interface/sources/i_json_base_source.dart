

import '../../utilis/models/base_data_model.dart';
import '../../utilis/models/remote_base_model.dart';
import '../../utilis/result/result.dart';

abstract class ICommerceResultBaseCRUDSource<T extends BaseDataModel>   {

  Future<Result<RemoteBaseModel, RemoteBaseModel>> addDataItem();
  Future <Result<RemoteBaseModel, RemoteBaseModel>> updateDataItem(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel>> deleteDataItem(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel<List<T>>  >> getDataList();
  Future <Result<RemoteBaseModel, RemoteBaseModel<T>>> getSingleData(String id);

}
