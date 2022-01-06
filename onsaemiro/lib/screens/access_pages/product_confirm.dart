import 'package:flutter/material.dart';

class productConfirmPage extends StatefulWidget {
  const productConfirmPage({Key? key}) : super(key: key);

  @override
  _productConfirmPageState createState() => _productConfirmPageState();
}

class _productConfirmPageState extends State<productConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 138,
        leading: Image.asset('assets/Vector(진한녹색).png'),
        backgroundColor: Colors.white,
        title: Text(
          '상품 수정하기',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(89, 89, 89, 1),
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.fromLTRB(24, 31, 24, 20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLines: 36,
                style: TextStyle(fontSize: 11),
                decoration: InputDecoration(
                    hintText: '문구 입력...',
                    hintStyle: TextStyle(fontSize: 11),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20.76, 19, 16.24, 18),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/이미지 추가.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.76, 19, 16.24, 18),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.76, 19, 16.24, 18),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.76, 19, 16.24, 18),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 110,
              height: 41,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.5)),
                  side: BorderSide(width: 2.0, color: Colors.green),
                ),
                child: Text(
                  '수정완료',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
