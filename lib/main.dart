import 'package:flutter/material.dart';
import 'models/item.dart';

//root do aplicativo
void main() => runApp(MeuApp());

//stl da primeira casaca do aplicativo respondendo ao root e denominando a homepage, titulo, tema
class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'PrimeiroApp',
    );
  }
}

//stl da homepage do aplicativo
class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(id: 0, title: "item 1", done: false));
    items.add(Item(id: 1, title: "item 2", done: true));
    items.add(Item(id: 3, title: "item 3", done: false));
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
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.id.toString()),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
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
}
