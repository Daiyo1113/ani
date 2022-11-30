import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation Examples';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            height: 250.0,
            color: null,
            child: AnimatedAlign(
              alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
              duration: const Duration(seconds: 1),
              onEnd: () => setState(() {
                selected = selected == false ? false : false;
              }),
              curve: Curves.fastOutSlowIn,
              child: const Icon(Icons.airplanemode_active,size: 50,color: Colors.blue),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            label: Text("go"),
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            icon: Icon(Icons.airplanemode_active_outlined),)
        ],
      ),
    );
  }
}
