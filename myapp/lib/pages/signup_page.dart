import 'package:flutter/material.dart';
import 'package:myapp/interfaces/base_auth.dart';
import 'package:myapp/pages/root_page.dart';
import 'package:myapp/services/auth.dart';
import 'package:page_transition/page_transition.dart';

class SignupForm {
  String name;
  String lastname;
  String phone;
  String email;
  String password;
  String birthday;
  String location;
}

class SignupPage extends StatefulWidget {
  SignupPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = new GlobalKey<FormState>();
  SignupForm signupForm = SignupForm();

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  String _errorMessage;

  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Covid App")),
        body: Stack(
          children: <Widget>[
            showForm(),
            showCircularProgress(),
          ],
        ));
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              // showLogo(),
              showNameInput(),
              showLastnameInput(),
              showPhoneInput(),
              showEmailInput(),
              showPasswordInput(),
              showBirthdayInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          )),
    );
  }

  Widget showCircularProgress() => _isLoading
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Container(
          height: 0,
          width: 0,
        );

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: Image.asset('assets/images/virus-icon.png'),
        ),
      ),
    );
  }

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nombre',
            icon: new Icon(
              Icons.account_circle,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'El nombre no puede estar vacío' : null,
        onSaved: (value) => signupForm.name = value.trim(),
      ),
    );
  }

  Widget showLastnameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Apellido',
            icon: new Icon(
              Icons.account_circle,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'El apellido no puede estar vacío' : null,
        onSaved: (value) => signupForm.lastname = value.trim(),
      ),
    );
  }

  Widget showPhoneInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Telefóno',
            icon: new Icon(
              Icons.phone,
              color: Colors.grey,
            )),
        onSaved: (value) => signupForm.phone = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Correo electrónico',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'El correo no puede estar vacío' : null,
        onSaved: (value) => signupForm.email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'La contraseña no puede estar vacía' : null,
        onSaved: (value) => signupForm.password = value.trim(),
      ),
    );
  }

  Widget showBirthdayInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.datetime,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Fecha de nacimiento',
            icon: new Icon(
              Icons.date_range,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'La fecha de nacimiento no puede estar vacía'
            : null,
        onSaved: (value) => signupForm.birthday = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: new Text(
            'Crear cuenta',
            style: new TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  void validateAndSubmit() async {
    // setState(() {
    //   _errorMessage = "";
    //   _isLoading = true;
    // });
    // if (validateAndSave()) {
    //   String userId = "";
    //   try {
    //     if (_isLoginForm) {
    //       userId = await widget.auth.signIn(_email, _password);
    //       print('Signed in: $userId');
    //     } else {
    //       userId = await widget.auth.signUp(_email, _password);
    //       print('Signed up user: $userId');
    //     }
    //     setState(() {
    //       _isLoading = false;
    //     });

    //     if (userId.length > 0 && userId != null && _isLoginForm) {
    //       widget.loginCallback();
    //     }
    //   } catch (e) {
    //     setState(() {
    //       _isLoading = false;
    //       _errorMessage = e.message;
    //       _formKey.currentState.reset();
    //     });
    //   }
    // }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text('¿Tienes una cuenta? Inicia sesión',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: openLoginForm);
  }

  void openLoginForm() {
    resetForm();
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: RootPage(
            auth: new Auth(),
          ),
        ),
        (Route<dynamic> route) => false);
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
