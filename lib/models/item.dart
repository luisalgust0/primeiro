class Item {
  String title;
  bool done;

  Item({this.title, this.done});

  Item.fromJson(Map<String, dynamic> json1) {
    title = json1['title'];
    done = json1['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> retorno = new Map<String, dynamic>();
    retorno['title'] = this.title;
    retorno['done'] = this.done;
    return retorno;
  }

  String oi() {
    return 'ola';
  }
}
