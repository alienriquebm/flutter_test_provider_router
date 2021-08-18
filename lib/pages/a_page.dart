import 'package:flutter/material.dart';
import 'package:test_provider_router/pages/b_page.dart';

class APage extends StatelessWidget {
  static final routeName = 'a';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page A'),
            Text('Go to B:'),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(BPage.routeName);
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
