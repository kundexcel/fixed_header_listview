// main.dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generate dummy data to feed the list view
  final List _peopleData = List.generate(1000, (index) {
    return {"name": "Person \#$index", "age": Random().nextInt(90) + 10};
  });

  // Item of the ListView
  Widget _listItem(index) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Text(index.toString(), style: const TextStyle(fontSize: 18)),
        title: Text(
          _peopleData[index]['name'].toString(),
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Text(_peopleData[index]['age'].toString(),
            style: const TextStyle(fontSize: 18, color: Colors.purple)),
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.amber,
              child: const ListTile(
                leading: Text('ID'),
                title: Text('Name'),
                trailing: Text('Age'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _peopleData.length,
                  itemBuilder: (_, index) {
                    return _listItem(index);
                  }),
            ),
          ],
        ));
  }
}