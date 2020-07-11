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
    items.add(Item(title: "item 1", done: false));
    items.add(Item(title: "item 2", done: true));
    items.add(Item(title: "item 3", done: false));

    var itemTest = Item(title: 'itemtest1', done: false);
    var item1 = items[0].toJson();
    var teste = itemTest.toJson();

    var test2 = Item.fromJson(item1);
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('primeiroApp'),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Text(widget.items[index].title);
        },
      ),
    );
  }
}
