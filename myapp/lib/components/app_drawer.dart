import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/search_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
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
                  buildListTile(context, 'Inicio', Icons.home, HomePage()),
                  buildListTile(context, 'Buscar', Icons.search, SearchPage()),
                  buildListTile(context, 'Contactos', Icons.contacts),
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
                        buildListTile(context, 'Configuración'),
                        buildListTile(
                            context, 'Ayuda y recomendaciones', Icons.help),
                      ],
                    ))))
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String text,
      [IconData iconData, StatefulWidget page]) {
    return ListTile(
      leading: Icon(iconData ?? Icons.settings),
      title: Text(text),
      onTap: () {
        if (page != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => page),
            (Route<dynamic> route) => false,
          );
        }
      },
    );
  }
}
