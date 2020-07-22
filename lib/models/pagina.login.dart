import 'package:flutter/material.dart';

class Paginalogin extends StatefulWidget {
  @override
  _PaginaloginState createState() => _PaginaloginState();
}

class _PaginaloginState extends State<Paginalogin> {
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
                height: 40,
                child: RaisedButton(
                  child: Text('entrar', style: TextStyle(fontSize: 18)),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
