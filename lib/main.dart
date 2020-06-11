import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Parameters Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Device Parameters Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String deviceID,hardware,brand,id,identifierForVendor;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

// android params
//      'version.securityPatch'
//      'version.sdkInt'
//      'version.release'
//      'version.previewSdkInt'
//      'version.incremental'
//      'version.codename'
//      'version.baseOS'
//      'board'
//      'bootloader'
//      'brand'
//      'device'
//      'display'
//      'fingerprint'
//      'hardware'
//      'host'
//      'id'
//      'manufacturer'
//      'model'
//      'product'
//      'supported32BitAbis'
//      'supported64BitAbis'
//      'supportedAbis'
//      'tags'
//      'type'
//      'isPhysicalDevice'
//      'androidId'
//      'systemFeatures'


//ios params
//      'name'
//      'systemName'
//      'systemVersion'
//      'model':
//      'localizedModel'
//      'identifierForVendor'
//      'isPhysicalDevice'
//      'utsname.sysname:'
//      'utsname.nodename:'
//      'utsname.release:'
//      'utsname.version:'
//      'utsname.machine:'



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'These are the Device Variables:',
            ),
            Text('',),
            Text('android> Device id : $deviceID',),
            //Text('android> hardware : $hardware',),
            //Text('android> brand : $brand',),
            //Text('android> id  : $id ',),
            Text('ios> identifierForVendor : $identifierForVendor',),

          Container(
            child: RaisedButton(
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('Retrieve', style: TextStyle(fontSize: 20)),
                ),
                  onPressed: () async {
                    try {
                      if (Platform.isAndroid) {
                        AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
                        setState(() {
                          deviceID = androidDeviceInfo.androidId.toString();
                          hardware=androidDeviceInfo.hardware.toString();
                          brand=androidDeviceInfo.brand.toString();
                          id=androidDeviceInfo.id.toString();
                        },
                        );
                      } else if (Platform.isIOS) {
                        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
                        setState(() {
                          print('identifierForVendor: ${iosDeviceInfo.identifierForVendor}');
                          identifierForVendor=iosDeviceInfo.identifierForVendor.toString();
                        },
                        );
                      }
                    } on PlatformException {
                      print('Error: Failed to get platform version.');
                    }



}
             )
          )
          ],

        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
