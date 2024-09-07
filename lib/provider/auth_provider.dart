import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  bool _loaidng = false;
  bool get loading => _loaidng;

  setLoading(bool value) {
    _loaidng = value;
    notifyListeners();
  }

  bool _obscure = true;
  bool get obscure => _obscure;

  setobscure() {
    _obscure = obscure;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response res =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (res.statusCode == 200) {
        print('Success');
        setLoading(false);
      } else {
        print('Success Error');
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
