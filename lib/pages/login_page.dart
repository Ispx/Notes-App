import 'package:flutter/material.dart';
import 'package:notes_app/controllers/login_controller.dart';
import 'package:notes_app/models/login_model.dart';
import 'package:notes_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: 'E-mail'),
                validator: (string) {
                  if (string == null || !string.contains('@')) {
                    return 'E-mail inválido';
                  }
                },
                onFieldSubmitted: (e) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Senha'),
                  validator: (string) {
                    if (string == null || string.length <= 3) {
                      return 'Senha inválida';
                    }
                  },
                  onFieldSubmitted: (e) {
                    setState(() {});
                  }),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: email.text == null && password.text == null
                      ? null
                      : () async {
                          if (formKey.currentState!.validate() == true) {
                            final loginModel = LoginModel(
                                email: email.text, password: password.text);
                            try {
                              final authModel = await loginController
                                  .signInWithEmailAndPassword(loginModel);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(authModel)),
                                  (route) => false);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString(),
                                  ),
                                ),
                              );
                            }
                          }
                        },
                  child: Text('Acessar'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: email.text == null && password.text == null
                      ? null
                      : () async {
                          if (formKey.currentState!.validate() == true) {
                            final loginModel = LoginModel(
                                email: email.text, password: password.text);
                            try {
                              final authModel = await loginController
                                  .createUserWithEmailAndPassword(loginModel);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(authModel)),
                                  (route) => false);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString(),
                                  ),
                                ),
                              );
                            }
                          }
                        },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
