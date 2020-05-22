import 'package:flutter/material.dart';

class Entry {
  final String title;
  final List<Entry> children;

  /// children 可选参数
  /// 默认值 <Entry>[]
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  new Entry(
    'Chapter A',
    <Entry>[
      new Entry(
        'Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry(
    'Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry(
    'Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry(
        'Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];

class AccordionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Accordion'),
        ),
        body: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              new AccordionItem(data[index]),
        ));
  }
}

class AccordionItem extends StatelessWidget {
  final Entry item;

  AccordionItem(this.item);

  Widget _buildItem(Entry data) {
    if (data.children.isEmpty) {
      return new ListTile(
        title: new Text(data.title),
      );
    } else {
      return new ExpansionTile(
        key: new PageStorageKey<Entry>(data),
        title: new Text(data.title),
        children: data.children.map(_buildItem).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem(item);
  }
}
