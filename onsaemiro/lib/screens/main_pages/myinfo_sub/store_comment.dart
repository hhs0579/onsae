import 'package:flutter/material.dart';

class store_commentPage extends StatefulWidget {
  const store_commentPage({Key? key}) : super(key: key);

  @override
  _store_commentPageState createState() => _store_commentPageState();
}

class _store_commentPageState extends State<store_commentPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.123,
        shape: Border(bottom: BorderSide(color: Colors.green)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.green, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          '상점 후기 작성',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.872,
                height: height * 0.5,
                padding: EdgeInsets.fromLTRB(0, 31, 0, 20),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 30,
                  style: TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                      hintText: '문구 입력...',
                      hintStyle: TextStyle(fontSize: 11),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.green))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  SizedBox(
                    width: width * 0.106,
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.106,
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.106,
                  ),
                  Container(
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
                height: height * 0.0418,
              ),
              Container(
                width: width * 0.293,
                height: height * 0.06,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.5)),
                    side: BorderSide(width: 2.0, color: Colors.green),
                  ),
                  child: Text(
                    '게시하기',
                    style: TextStyle(color: Color(0xff595959), fontSize: 13),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
