import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/common-models/common_api_model.dart';
import 'package:grocery_app/common-models/user_model.dart';
import 'package:grocery_app/screens/signup/repository/signup_repository.dart';
import 'package:grocery_app/src/app/contants/contants.dart';
import 'package:grocery_app/src/app/enums/app_enums.dart';
import 'package:grocery_app/src/app/static_info.dart';

class SignupProvider extends ChangeNotifier {
  final SignupRepository signupRepository = SignupRepository();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup({
    required Function(String screen) moveToNextScreen,
    required Function({
      required ToastType toastType,
      required String message,
    }) showToastMsg,
  }) async {
    try {
      ApiResponseModel apiResponseModel = await signupRepository.signup(
          email: emailController.text.trim(),
          userName: nameController.text.trim(),
          password: passwordController.text.trim());
      if(apiResponseModel.success!){
        UserModel userModel = UserModel.fromJson(apiResponseModel.data);
        StaticInfo.userModel = userModel;
        StaticInfo.authToken = userModel.authtoken;
        showToastMsg(message: apiResponseModel.message ?? toastMsg, toastType: ToastType.success);
      }else{
        showToastMsg(toastType: ToastType.error, message: apiResponseModel.message ?? toastMsg);
      }
    } catch (e) {
      showToastMsg(toastType: ToastType.error, message: e.toString());
    }
  }

  String? nameValidator(value) {
    if (value == '') {
      return 'Name is required';
    } else {
      return null;
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
