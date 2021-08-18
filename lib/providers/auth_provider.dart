import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _tokenIsExpired = false;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  bool get tokenIsExpired {
    return _tokenIsExpired;
  }

  _setIsLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  _setTokenIsExpired(bool value) {
    _tokenIsExpired = value;
    notifyListeners();
  }

  Future<bool> doLogin() async {
    debugPrint('Trying to login...');
    try {
      await Future.delayed(Duration(seconds: 5));
      _setIsLoggedIn(true);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  Future<bool> checkLogin() async {
    // simulate check if token exist in localstorage and check the token
    debugPrint('Checking if token exist');
    bool tokenExist = true;
    debugPrint('Token exist? $tokenExist');
    bool tokenIsValid;
    if (tokenExist) {
      // validate the token
      try {
        await Future.delayed(Duration(seconds: 5));
        tokenIsValid = false; // false: the token is invalid
        debugPrint('token is valid? $tokenIsValid');
        _setIsLoggedIn(true);
        if (!tokenIsValid) {
          _setTokenIsExpired(true);
          _setIsLoggedIn(false);
          return false; // if token is invalid, must show login
        }
        return true; // if token is valid must show dashboard
      } catch (e) {
        debugPrint('Error: $e');
        _setIsLoggedIn(false);
        return false;
      }
    }
    _setIsLoggedIn(false);
    return false; // no token, show login
  }
}
