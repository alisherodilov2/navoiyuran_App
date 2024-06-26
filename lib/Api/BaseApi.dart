class BaseApi {
  static String api = "https://lab.navoiyuran.uz";
}

class Auth extends BaseApi {
  static var login = '${BaseApi.api}/api/login';
  static var logout = '${BaseApi.api}/api/v1/logout';
  static var dashboard = '${BaseApi.api}/api/v1/dashboard';
  static var tasks = '${BaseApi.api}/api/v1/dashboard/tasks';
  static var tasksStatus = '${BaseApi.api}/api/v1/dashboard/tasksStatus';
}

class SubApi extends BaseApi {
  static var orders = '${BaseApi.api}/api/orders';
  static var labaratory = '${BaseApi.api}/api/labaratory';
  static var orderShow = '${BaseApi.api}/api/samplePart/';
}

class Dispatcher extends BaseApi {
  static var qrPageLoading = '${BaseApi.api}/api/dispatcher/active/';
  static var qrConfirmation = '${BaseApi.api}/api/dispatcher/active/confirm/';
  static var orderDispatcher = '${BaseApi.api}/api/dispatcher/orders';
}

class Labatory extends BaseApi {
  static var activeSample = '${BaseApi.api}/api/lab/samplePart/';
  static var activeSampleActive = '${BaseApi.api}/api/lab/samplePart/active/';
}
