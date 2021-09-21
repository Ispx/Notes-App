import 'package:notes_app/models/auth_model.dart';
import 'package:notes_app/models/login_model.dart';

abstract class LoginInterface {
  Future<AuthModel> createUserWithEmailAndPassword(LoginModel loginModel);
  Future<AuthModel> signInWithEmailAndPassword(LoginModel loginModel);
}
