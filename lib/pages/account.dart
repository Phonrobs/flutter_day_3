import 'package:flutter/material.dart';
import 'package:test_app1/widgets/main_drawer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: QrImage(
              data: 'http://www.up.ac.th',
              version: 2,
              size: 200.0,
            ),
          ),
          Center(
            child: OutlineButton(
              child: Text('Scan'),
              onPressed: () {
                BarcodeScanner.scan().then((code) {
                  print(code);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
