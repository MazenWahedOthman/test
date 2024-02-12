import 'package:task/helpers/entities/body/sign_in_body.dart';
import 'package:task/helpers/error/error_handle.dart';
import 'package:task/services/api/auth/auth_service.dart';

class AuthTaskService extends AuthService {
  @override
  Future<bool?> signIn({required SignInBody body}) async {
    try {
      // Add logic for api
      await Future.delayed(const Duration(seconds: 3));
    } catch (error) {
      throw ErrorHandle.getException(error: error, url: "url");
    }

    return true;
  }
}
