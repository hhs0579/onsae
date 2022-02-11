import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class StoreOpen extends StatefulWidget {
  const StoreOpen({Key? key}) : super(key: key);

  @override
  _StoreOpenState createState() => _StoreOpenState();
}

final storename = TextEditingController();

class _StoreOpenState extends State<StoreOpen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('상점 개설')),
        body: Center(
          child: TextField(
            controller: storename,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
