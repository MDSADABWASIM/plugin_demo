import 'package:flutter/material.dart';
import 'package:plugin_demo/plugin_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

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
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fancy Toast'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Custom Toast'),
                    onPressed: showLongToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Error Toast'),
                    onPressed: showErrorToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Info Toast'),
                    onPressed: showInfoToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Warning Toast'),
                    onPressed: showWarningToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
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
