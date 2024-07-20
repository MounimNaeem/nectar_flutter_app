import 'package:flutter/cupertino.dart';
import 'package:grocery_app/common-models/common_api_model.dart';
import 'package:grocery_app/common-models/user_model.dart';
import 'package:grocery_app/screens/login/repository/login_repository.dart';
import 'package:grocery_app/src/app/contants/contants.dart';
import 'package:grocery_app/src/app/enums/app_enums.dart';
import 'package:grocery_app/src/app/static_info.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepository loginRepository = LoginRepository();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login({
    required Function(Widget view) moveToNextScreen,
    required Function({
    required ToastType toastType,
    required String message,
    }) showToastMsg,
}) async {
    try {
      ApiResponseModel apiResponseModel = await loginRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if(apiResponseModel.success!){
        UserModel userModel = UserModel.fromJson(apiResponseModel.data);
        StaticInfo.userModel = userModel;
        StaticInfo.authToken = userModel.authtoken;
        showToastMsg(message: apiResponseModel.message ?? toastMsg, toastType: ToastType.success);
      }else{
        showToastMsg(message: apiResponseModel.message ?? toastMsg,toastType: ToastType.error);
      }
    } catch (e) {
      showToastMsg(message: e.toString(), toastType: ToastType.error);
    }
  }

  String? emailValidator(value) {
    if (value == '') {
      return 'Email is required';
    } else {
      return null;
    }
  }

  String? passwordValidator(value) {
    if (value == '') {
      return 'Password is required';
    } else {
      return null;
    }
  }
}
