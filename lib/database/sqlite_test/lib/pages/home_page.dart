import 'package:flutter/material.dart';
import 'package:sqlite_test/data_model.dart';

class HomePage extends StatelessWidget {
  List<Model> _list = [
    Model(value: 'First', isSaved: true),
    Model(value: 'Second', isSaved: true),
    Model(value: 'Third', isSaved: true),
    Model(value: 'Fourth', isSaved: true),
    Model(value: 'Fifth', isSaved: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqlite'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: _makeListView(),
      ),
    );
  }

  Widget _makeListView() {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListViewCell(
            value: _list[index].value,
            isSaved: _list[index].isSaved,
          );
        });
  }
}

class ListViewCell extends StatefulWidget {
  final String value;
  bool isSaved;

  ListViewCell({Key? key, required this.value, required this.isSaved})
      : super(key: key);

  @override
  _ListViewCellState createState() => _ListViewCellState();
}

class _ListViewCellState extends State<ListViewCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(border: Border.all()),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            widget.value,
            textAlign: TextAlign.center,
          )),
          Expanded(
            child: Checkbox(
              value: widget.isSaved,
              onChanged: (value) {
                widget.isSaved = !widget.isSaved;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
