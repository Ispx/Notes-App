import 'package:flutter/foundation.dart';

class AuthModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photo;
  AuthModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.photo});
}
