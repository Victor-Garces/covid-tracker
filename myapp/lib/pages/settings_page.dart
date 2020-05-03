import 'package:flutter/material.dart';
import 'package:myapp/interfaces/base_auth.dart';
import 'package:myapp/pages/root_page.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Cuenta',
            tiles: [
              SettingsTile(
                  title: 'Cerrar sesión',
                  leading: Icon(Icons.language),
                  onTap: () => logOut()),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> logOut() async {
    try {
      await widget.auth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: RootPage(
              auth: new AuthService(),
            ),
          ),
          (Route<dynamic> route) => false);
    } catch (e) {
      print(e);
    }
  }
}
