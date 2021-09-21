import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/exceptions/login_exception.dart';
import 'package:notes_app/interfaces/login_interface.dart';
import 'package:notes_app/models/auth_model.dart';
import 'package:notes_app/models/login_model.dart';
import 'package:notes_app/pages/login_page.dart';

class LoginController implements LoginInterface {
  Future<AuthModel> createUserWithEmailAndPassword(
      LoginModel loginModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: loginModel.email, password: loginModel.password);
      return AuthModel(
          id: userCredential.user.uid,
          name: userCredential.user.email,
          email: userCredential.user.email,
          photo: userCredential.user.photoURL);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw LoginException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw LoginException('The account already exists for that email.');
      }
    }
    throw 'Ocorreu um erro no register account';
  }

  @override
  Future<AuthModel> signInWithEmailAndPassword(LoginModel loginModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginModel.email, password: loginModel.password);
      return AuthModel(
          id: userCredential.user.uid,
          name: userCredential.user.displayName,
          email: userCredential.user.email,
          photo: userCredential.user.photoURL);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        LoginException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        LoginException('Wrong password provided for that user.');
      }
    }
    throw 'Ocorreu um erro no sign';
  }
}
