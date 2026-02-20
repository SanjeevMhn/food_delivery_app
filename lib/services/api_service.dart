class ApiService {

  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

}