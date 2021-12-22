import 'package:flutter/material.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/Vector.png'),
            ),
            SizedBox(
              width: 40,
            ),
            Text('앱 접근 권한 안내')
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.lightGreen),
          ),
        )
      ],
    ));
  }
}
