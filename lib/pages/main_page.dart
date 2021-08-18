import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_router/providers/auth_provider.dart';
import 'package:test_provider_router/pages/pages.dart';

import 'a_page.dart';

class MainPage extends StatefulWidget {
  static final String routeName = "main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isCheckingToken = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // before => final bool isLoggedIn = await Provider.of<AuthProvider>(context, listen: false).checkLogin();
      final bool isLoggedIn = await context.read<AuthProvider>().checkLogin();
      if (isLoggedIn) {
        // Navigator.of(context).pushReplacementNamed(DashboardPage.routeName);
        Navigator.of(context).pushReplacementNamed(APage.routeName);
        Navigator.of(context).pushNamed(BPage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCheckingToken
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Text('Main'),
            ),
    );
  }
}
