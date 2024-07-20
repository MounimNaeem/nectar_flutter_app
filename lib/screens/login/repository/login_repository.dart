import 'package:grocery_app/common-models/common_api_model.dart';
import 'package:grocery_app/services/api_request.dart';
import 'package:grocery_app/src/app/contants/contants.dart';

class LoginRepository {
  final BaseService _apiRequest = ApiRequests();

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> body = {"email": email, "password": password};
      dynamic response =
          await _apiRequest.postRequest(url: loginApi, body: body);
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response);
      return apiResponseModel;
    } catch (e) {
      throw e;
    }
  }
}
