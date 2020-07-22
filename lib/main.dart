import 'dart:convert';

import 'package:primeiro/models/pagina.login.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/item.dart';

//root do aplicativo
void main() => runApp(MeuApp());

//stl da primeira casaca do aplicativo respondendo ao root e denominando a homepage, titulo, tema
class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Paginalogin(),
      title: 'PrimeiroApp',
    );
  }
}

//stl da homepage do aplicativo
// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    // items.add(Item(id: 0, title: "item 1", done: false));
    // items.add(Item(id: 1, title: "item 2", done: true));
    // items.add(Item(id: 2, title: "item 3", done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addTarefa() {
    if (novocontrolador.text.isEmpty) return;
    setState(() {
      this
          .widget
          .items
          .add(Item(id: 0, title: this.novocontrolador.text, done: false));
      this.novocontrolador.clear();
      salvar();
    });
  }

  var novocontrolador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: this.novocontrolador,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
          decoration: InputDecoration(
            labelText: 'NOVA TAREFA',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];

          return Dismissible(
            onDismissed: (direction) {
              excluir(item);
            },
            background: Container(
              color: Colors.red.withOpacity(0.4),
            ),
            key: Key(item.id.toString()),
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                  salvar();
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addTarefa,
        backgroundColor: Colors.blue,
      ),
    );
  }

  salvar() async {
    var pacoteshar = await SharedPreferences.getInstance();
    await pacoteshar.setString("lista", jsonEncode(widget.items));
  }

  Future carregar() async {
    var pacoteshar = await SharedPreferences.getInstance();

    var data = pacoteshar.getString('lista');
    if (data != null) {
      Iterable decoded = jsonDecode(data);

      var teste = decoded.map((it) => Item.fromJson(it)).toList();

      setState(() {
        this.widget.items = teste;
      });
    } else {
      print('sem dados');
    }
  }

  _HomePageState() {
    carregar();
  }

  void excluir(item) {
    setState(() {
      this.widget.items.remove(item);
      salvar();
    });
  }
}
