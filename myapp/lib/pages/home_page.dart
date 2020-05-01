import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/abstractions/base_auth.dart';
import 'package:myapp/components/app_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: new AppBar(
          title: new Text('Covid App'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Cerrar sesión',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        drawer: AppDrawer());
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
}
