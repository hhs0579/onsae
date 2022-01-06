import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/product_confirm.dart';
import 'package:onsaemiro/screens/main_pages/edit_info.dart';

class productRegistrationPage extends StatefulWidget {
  const productRegistrationPage({Key? key}) : super(key: key);

  @override
  _productRegistrationPageState createState() =>
      _productRegistrationPageState();
}

productBox(
  name,
  confirm,
  delete,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: Container(
        width: 412,
        height: 90,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 12, 0, 12),
              child: Image.asset('assets/망넛이네 약콩두유.png'),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 70,
                    height: 21,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 9,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(9, 2, 8, 0),
                        filled: true,
                        fillColor: Color.fromRGBO(196, 196, 196, 1),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4)),
                        hintText: '가격입력하기',
                        hintStyle: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 119,
            ),
            Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text('승인대기중..', style: TextStyle(fontSize: 11)),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: confirm,
                        child: Text(
                          '수정하기',
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        )),
                    TextButton(
                        onPressed: delete,
                        child: Text(
                          '제거하기',
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        )),
                  ],
                ),
              ],
            )
          ],
        )),
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
            SizedBox(
              height: 550,
              child: Column(
                children: [
                  SizedBox(
                    height: items.length * 105,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: Key(items[index]),
                            child: productBox(input, () {
                              Get.to(productConfirmPage());
                            }, () {
                              setState(() {
                                items.removeAt(index);
                              });
                            }),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  if (items.length < 5)
                    Container(
                      width: 44,
                      height: 44,
                      child: FloatingActionButton(
                        elevation: 0.0,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 0.7),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("상품 등록"),
                                    content: TextField(
                                      decoration: InputDecoration(
                                          hintText: '약콩 두유 100'),
                                      onChanged: (String value) {
                                        input = value;
                                      },
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              items.add(input);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("추가"))
                                    ]);
                              });
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
            SizedBox(
              height: 9,
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
                  '등록하기',
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
