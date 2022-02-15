import 'package:flutter/material.dart';

class product_CommentPage extends StatefulWidget {
  const product_CommentPage({Key? key}) : super(key: key);

  @override
  _product_CommentPageState createState() => _product_CommentPageState();
}

class _product_CommentPageState extends State<product_CommentPage> {
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
          '상품 후기 작성',
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
            children: [
              SizedBox(
                height: height * 0.0628,
              ),
              Container(
                height: height * 0.54,
                width: width * 0.885,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 40,
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
