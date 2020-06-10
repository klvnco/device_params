import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
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
  String deviceID,hardware,brand,id;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text('Device id : $deviceID',),
            Text('hardware : $hardware',),
            Text('brand : $brand',),
            Text('id  : $id ',),
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
                _incrementCounter();

               AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
            setState(() {
            print('androidId: ${androidDeviceInfo.androidId}');
             print('hardware: ${androidDeviceInfo.hardware}');
           print('brand: ${androidDeviceInfo.brand}');
            print('id: ${androidDeviceInfo.id}');
               deviceID = androidDeviceInfo.androidId.toString();
            hardware=androidDeviceInfo.hardware.toString();
            brand=androidDeviceInfo.brand.toString();
            id=androidDeviceInfo.id.toString();
             },
             );}
             )
          )
          ],

        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
