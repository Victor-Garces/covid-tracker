import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/abstractions/base_auth.dart';

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
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.amber[50],
          ),
          child: Drawer(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage('assets/images/virus-icon.png'),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      buildListTile('Inicio', Icons.home, context),
                      buildListTile('Buscar', Icons.search, context),
                      buildListTile('Contactos', Icons.contacts, context),
                    ],
                  ),
                ),
                Container(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                            child: Column(
                          children: <Widget>[
                            Divider(),
                            buildListTile(
                                'Configuración', Icons.settings, context),
                            buildListTile(
                                'Ayuda y recomendaciones', Icons.help, context),
                          ],
                        ))))
              ],
            ),
          ),
        ));
  }

  ListTile buildListTile(String text, IconData iconData, BuildContext context) {
    print('Im here');
    return ListTile(
      leading: Icon(iconData),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
      },
    );
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
