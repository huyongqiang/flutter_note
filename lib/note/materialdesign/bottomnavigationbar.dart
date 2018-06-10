import 'package:flutter/material.dart';
import 'common.dart';

class BottomNavigationBarApp extends StatefulWidget {
  @override
  createState() => new _BottomNavigationAppStage();
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Run', icon: Icons.directions_run),
  const Choice(title: 'Subway', icon: Icons.directions_subway),
  const Choice(title: 'Transit', icon: Icons.directions_transit),
];

class _BottomNavigationAppStage extends State<BottomNavigationBarApp> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavigationBarItemList = choices
        .map((choice) => new BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: new Icon(choice.icon, color: Colors.indigoAccent),
            title: new Text(
              choice.title,
//              style: new TextStyle(color: Colors.red),
            )))
        .toList();
    List<ChoiceCard> indexedStackChildren = choices.map((choice) => new ChoiceCard(choice: choice)).toList();
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBarApp')),
      bottomNavigationBar: new BottomNavigationBar(
        items: bottomNavigationBarItemList,
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        // 默认为 shifting，只有选中的才有文字
        fixedColor: Colors.lightGreen,
        // 为 fixed 时，如果没有给 BottomNavigationBarItem 的 title 设置文字颜色，那么文字颜色为这里设置的
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
//      body: new ChoiceCard(choice: choices[_curIndex]),
      body: new IndexedStack(index: _curIndex, children: indexedStackChildren),
    );
  }
}
