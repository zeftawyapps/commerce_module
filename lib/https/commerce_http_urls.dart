// create class UsersHttpUrls use singleton pattern
import 'package:commerce_module/https/i_http_urls.dart';

class CommerceHttpUrls {
  // create instance UsersHttpUrls
  static final CommerceHttpUrls _instance = CommerceHttpUrls._internal();

  // create factory UsersHttpUrls
  factory CommerceHttpUrls() => _instance;
  factory CommerceHttpUrls.setBaseUrl(String baseUrl) {
    _instance.BaseUrl = baseUrl;
    return _instance;
  }
  factory CommerceHttpUrls.setEndPointUrls(HttpUrls urls) {
    return _instance;
  }
  factory CommerceHttpUrls.setUserToken(String token) {
    CommerceHttpHeader().setToken(token);
    return _instance;
  }
  // create UsersHttpUrls._internal
  CommerceHttpUrls._internal();

  // create method getUsers
  String getUsers() => 'https://jsonplaceholder.typicode.com/users';
  // add user base url variable
  String BaseUrl = '';
}

// create class UsersHttpheader use singleton pattern
class CommerceHttpHeader {
  // create instance UsersHttpheader
  static final CommerceHttpHeader _instance = CommerceHttpHeader._internal();

  // create factory UsersHttpheader
  factory CommerceHttpHeader() => _instance;
  void setToken(String token) {
    _usertoken = token;
  }

  String get usertoken => _usertoken;
  // create UsersHttpheader._internal
  CommerceHttpHeader._internal();

  String _usertoken = '';
}
