import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider_router/pages/pages.dart';
import 'package:test_provider_router/providers/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'main',
        routes: {
          MainPage.routeName: (_) => MainPage(),
          LoginPage.routeName: (_) => LoginPage(),
          DashboardPage.routeName: (_) => DashboardPage(),
          APage.routeName: (_) => APage(),
          BPage.routeName: (_) => BPage(),
        },
      ),
    );
  }
}
