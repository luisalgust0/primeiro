import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:primeiro/main.dart';

class Paginalogin extends StatefulWidget {
  @override
  _PaginaloginState createState() => _PaginaloginState();
}

class _PaginaloginState extends State<Paginalogin> {
  Future<FirebaseUser> dataLogin(String email, String senha) async {
    //login
    try {
      AuthResult result =
          await auth.signInWithEmailAndPassword(email: email, password: senha);
      final FirebaseUser user = result.user;

      final FirebaseUser currentUser = await auth.currentUser();

      print('$user');

      return user;
    } catch (error) {
      return null;
    }
  }

  Future<FirebaseUser> dataInscricao(String email, String senha) async {
    //register
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      final FirebaseUser user = result.user;
      return user;
    } catch (error) {
      return null;
    }
  }

  Widget mensagemError(BuildContext context) {
    return AlertDialog(
      title: new Text("Alert Dialog titulo"),
      content: new Text("Alert Dialog body"),
      actions: <Widget>[
        // define os botões na base do dialogo
        new FlatButton(
          child: new Text("Fechar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  var emailController = new TextEditingController();
  var senhaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: new TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Divider(height: 15),
              TextFormField(
                obscureText: true,
                controller: senhaController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'senha',
                  labelStyle: new TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                keyboardType: TextInputType.text,
              ),
              Divider(height: 15),
              ButtonTheme(
                //botão entrar
                height: 40,
                child: RaisedButton(
                  child: Text('entrar', style: TextStyle(fontSize: 18)),
                  color: Colors.white,
                  onPressed: () async {
                    var user = await dataLogin(
                        emailController.text, senhaController.text);

                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => mensagemError(context));
                    }
                  },
                ),
              ),
              Divider(height: 15),
              ButtonTheme(
                //botão inscrevase
                height: 40,
                child: RaisedButton(
                  child: Text('registrar', style: TextStyle(fontSize: 18)),
                  color: Colors.white,
                  onPressed: () {
                    dataInscricao(emailController.text, senhaController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
