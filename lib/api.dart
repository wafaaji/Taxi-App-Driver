class Api {
  static const baseApi = 'http://192.168.1.104:8000/api';
}

class ApiEndPoint {
  static const login = '/driver/login';
  static const logout = '/driver/logout';
  static const pin =  '/just_driver/checkpin';
  static const editProfile =  '/just_driver/updatePro';
  static const getProfile =  '/just_driver/getprodriver';
  static const activate =  '/just_driver/activate';
  static const accept =  '/just_driver/accept';
  static const refusal =  '/just_driver/refusal';
  static const location =  '/just_driver/updateaddress';
}