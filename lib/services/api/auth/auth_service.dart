import 'package:task/helpers/entities/body/sign_in_body.dart';
import 'package:task/services/app/api_services.dart';

abstract class AuthService extends ApiServices {
  Future<bool?> signIn({required SignInBody body});
}
