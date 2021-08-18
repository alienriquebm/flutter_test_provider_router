import 'package:flutter/material.dart';
import 'package:test_provider_router/pages/dashboard_page.dart';

class BPage extends StatelessWidget {
  static final routeName = 'b';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page B'),
            Text('Go to Dashboard:'),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    DashboardPage.routeName, ModalRoute.withName(DashboardPage.routeName));
              },
              icon: Icon(Icons.dashboard),
              label: Text('Go'),
            )
          ],
        ),
      ),
    );
  }
}
