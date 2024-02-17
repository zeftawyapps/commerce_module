import '../../../utilis/models/remote_base_model.dart';
import '../../../utilis/result/result.dart';

abstract class IEductionalHttpSource{
  Future<CommerceResult<RemoteBaseModel , Map<String ,dynamic>>>  addSortDepartmant(String depId , int sort)  ;
  Future<CommerceResult<RemoteBaseModel , Map<String ,dynamic>>>  createDepartmant(String depName  )  ;
  Future<CommerceResult<RemoteBaseModel , Map<String ,dynamic>>>  addDepartmantMony(String depId , int mony)  ;
  Future< CommerceResult<RemoteBaseModel , Map<String ,dynamic>>>   publishDepartmant(String depId , bool ispublish)  ;
  Future< CommerceResult<RemoteBaseModel ,  Map<String , dynamic>>>    getQuiz(String depId  )  ;
  Future< CommerceResult<RemoteBaseModel ,  Map<String , dynamic>>>     setGameResultToUserProfile(String depId , int score ,
     int currectAnswer ) ;

  }