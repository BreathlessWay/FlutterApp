import 'dart:math';

import 'package:flutter/material.dart';

typedef Widget RemovedItemBuilder<T>(
    T item, BuildContext context, Animation<double> animation);

class ListModel<E> {
  final List<E> _items;
  final GlobalKey<AnimatedListState> _listKey;
  final RemovedItemBuilder<E> removedItemBuilder;

  ListModel(Iterable<E> initialItems, GlobalKey<AnimatedListState> listKey,
      this.removedItemBuilder)
      : _items = new List<E>.from(initialItems ?? <E>[]),
        _listKey = listKey;
  // 获取AnimatedListState组件实例，类似react的ref
  AnimatedListState get _animatedList => _listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
          index,
              (BuildContext context, Animation<double> animation) =>
              removedItemBuilder(removedItem, context, animation));
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class AnimateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AnimateScreenState();
  }
}

class AnimateScreenState extends StatefulWidget {
  @override
  AnimateScreenStateState createState() => new AnimateScreenStateState();
}

class AnimateScreenStateState extends State<AnimateScreenState> {
  final GlobalKey<AnimatedListState> _listKey =
  new GlobalKey<AnimatedListState>();

  ListModel<int> _list;

  int _selectedItem;

  @override
  void initState() {
    super.initState();
    _list = new ListModel([0, 1, 2], _listKey, _buildRemovedItem);
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  void _addItem() {
    final int _index =
    _selectedItem != null ? _list.indexOf(_selectedItem) : _list.length;
    _list.insert(_index, Random().nextInt(30));
//    setState(() {
//      _list = _list;
//    });
  }

  void _removeItem() {
    if (_list.length == 0) return;
    int _index;
    if (_selectedItem != null) {
      _index = _list.indexOf(_selectedItem);
    } else {
      _index = _list.length - 1;
    }
    _list.removeAt(_index);
    setState(() {
//      _list = _list;
      _selectedItem = null;
    });
  }

  void _handlePress(int item) {
    setState(() {
      _selectedItem = _selectedItem == item ? null : item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('AnimatedList'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_circle), onPressed: _addItem),
            new IconButton(
                icon: new Icon(Icons.remove_circle), onPressed: _removeItem),
          ],
        ),
        body: new Padding(
          padding: EdgeInsets.all(20.0),
          child: new AnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                int _item = _list[index];
                return new CardItem(
                    animation: animation,
                    item: _item,
                    selected: _item == _selectedItem,
                    onPress: _handlePress);
              }),
        ));
  }
}

typedef void OnPressCallback(int item);

class CardItem extends StatelessWidget {
  final int _item;
  final bool _selected;
  final OnPressCallback _onPress;
  final Animation<double> _animation;

  CardItem(
      {Key key,
        @required int item,
        @required bool selected,
        @required Animation<double> animation,
        OnPressCallback onPress})
      : _item = item,
        _selected = selected,
        _onPress = onPress,
        _animation = animation,
        super(key: key);

  Color get cardColor => _selected
      ? Colors.white
      : Colors.primaries[_item % Colors.primaries.length];

  void handlePress() {
    if (_onPress != null) {
      _onPress(_item);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = Theme.of(context).textTheme.headline4;

    if (_selected) {
      _textStyle = _textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }

    return new GestureDetector(
        onTap: handlePress,
        child: new Padding(
            padding: EdgeInsets.all(4.0),
            child: new SizeTransition(
              axis: Axis.vertical,
              sizeFactor: _animation,
              child: new SizedBox(
                height: 128,
                child: new Card(
                  color: cardColor,
                  child: new Center(
                    child: new Text(
                      '$_item',
                      style: _textStyle,
                    ),
                  ),
                ),
              ),
            )));
  }
}
