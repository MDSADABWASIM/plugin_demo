import 'package:flutter/material.dart';
import 'package:plugin_demo/plugin_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

//Using Two native android plugin FancyToast and Toasty in flutter.
class _MyAppState extends State<MyApp> {
  void showLongToast() {
    PluginDemo.showToast(
      msg: "This is Custom Toast",
      toastLength: Toast.LENGTH_LONG,
      toastType: ToastType.DEFAULT,
    );
  }

  void showInfoToast() {
    PluginDemo.infoDialog();
  }

  void showWarningToast() {
    PluginDemo.warningDialog();
  }

  void showErrorToast() {
    PluginDemo.errorDialog();
  }

  void showAlert() {
    PluginDemo.dialog();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Native plugins in Flutter'),
          centerTitle: true,
        ),
        body: new Center(
          child: new ListView(
            padding: EdgeInsets.all(8),
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Using FancyToast and Toasty Native Android sdk plugins in Flutter',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              SizedBox(height: 20),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                  color: Colors.orange[100],
                    elevation: 5,
                    shape: OutlineInputBorder(),
                    child: new Text('Show Custom Toast'),
                    onPressed: showLongToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    color: Colors.red[100],
                    elevation: 5,
                    shape: OutlineInputBorder(),
                    child: new Text('Show Error Toast'),
                    onPressed: showErrorToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    color: Colors.blue[100],
                    elevation: 5,
                    shape: OutlineInputBorder(),
                    child: new Text('Show Info Toast'),
                    onPressed: showInfoToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    color: Colors.yellow[100],
                    elevation: 5,
                    shape: OutlineInputBorder(),
                    child: new Text('Show Warning Toast'),
                    onPressed: showWarningToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    color: Colors.green[100],
                  elevation: 5,
                  shape: OutlineInputBorder(),
                  child: new Text('Show Success Toast'),
                  onPressed: showAlert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
