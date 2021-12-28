import 'package:flutter/material.dart';

class edit_infoPage extends StatefulWidget {
  const edit_infoPage({Key? key}) : super(key: key);

  @override
  editInfoState createState() => editInfoState();
}

class editInfoState extends State<edit_infoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: Border(bottom: BorderSide(color: Colors.green)),
        leading: Image.asset('assets/Vector.png'),
        actions: [Image.asset('assets/장바구니.png')],
        backgroundColor: Colors.white,
        title: Text(
          '회원정보 수정',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: '이메일',
                  labelStyle: TextStyle(fontSize: 15),
                  hintText: 'onsemiro.gmail.com',
                  hintStyle: TextStyle(fontSize: 15)),
            ),
          )
        ],
      ),
    );
  }
}
