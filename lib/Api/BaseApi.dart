class BaseApi {
  static String api = "https://lab.works.uz";
}

class Auth extends BaseApi {
  static var login = '${BaseApi.api}/api/login';
  static var logout = '${BaseApi.api}/api/v1/logout';
}

class SubApi extends BaseApi {
  static var orders = '${BaseApi.api}/api/orders';
  static var labaratory = '${BaseApi.api}/api/labaratory';
  static var orderShow = '${BaseApi.api}/api/samplePart/';
}
