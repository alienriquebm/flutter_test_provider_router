import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_router/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isTokenExpired = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    isTokenExpired = context.read<AuthProvider>().tokenIsExpired;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (isTokenExpired) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Token is expired'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Text('Hi, I\'m Login Screen'),
      ),
    );
  }
}
