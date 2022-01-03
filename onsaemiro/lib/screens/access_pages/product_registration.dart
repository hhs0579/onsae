import 'package:flutter/material.dart';

class productRegistrationPage extends StatefulWidget {
  const productRegistrationPage({Key? key}) : super(key: key);

  @override
  _productRegistrationPageState createState() =>
      _productRegistrationPageState();
}

productBox() {
  return Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: Container(
      width: 412,
      height: 83,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    ),
  );
}

class _productRegistrationPageState extends State<productRegistrationPage> {
  List items = [];
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        shape: Border(bottom: BorderSide(color: Colors.green)),
        leading: Image.asset('assets/Vector.png'),
        backgroundColor: Colors.white,
        title: Text(
          '상품 등록목록',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 21,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                width: 412,
                height: 83,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
              ),
            ),
            Container(
              width: 44,
              height: 44,
              child: FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Color.fromRGBO(196, 196, 196, 0.7),
                onPressed: () {
                  builder:
                  (BuildContext context) {
                    return AlertDialog(
                      title: Text('상품 등록'),
                      content: TextField(
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                    );
                  };
                },
                child: Icon(
                  Icons.add,
                  size: 19,
                  color: Color.fromRGBO(89, 89, 89, 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
