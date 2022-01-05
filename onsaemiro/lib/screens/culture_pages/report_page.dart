import 'package:flutter/material.dart';

class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  _reportPageState createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        toolbarHeight: 138,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 56, 0, 0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/Vector(진한녹색).png'),
                    color: Color.fromRGBO(67, 123, 86, 1),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Text(
                    '신고하기',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(67, 123, 86, 1),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '등록하기',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 31, 0, 13),
              child: Text(
                '신고 사유 (필수)',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Column(
              children: [
                MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value,
                  title: Text(
                    '상품과 관련 없는 내용',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value,
                  title: Text(
                    '개인의 상업적 홍보',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 3,
                  groupValue: _value,
                  title: Text(
                    '개인정보 누출 위험',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 4,
                  groupValue: _value,
                  title: Text(
                    '저작권 불법 도용',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 5,
                  groupValue: _value,
                  title: Text(
                    '상품리뷰가 아닌 판매자 리뷰 내용',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 6,
                  groupValue: _value,
                  title: Text(
                    '기타',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (value) => setState(() => _value = value!),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 31, 0, 13),
              child: Text(
                '신고 이유 (필수)',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: SizedBox(
                height: 280,
                width: 335,
                child: TextField(
                  maxLines: 20,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(108, 205, 108, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(108, 205, 108, 1))),
                      hintText: '비방,욕설,광고,잘못된 정보 등 신고 사유를 구체적으로 작성해주세요.',
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey[500])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 26,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 6),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return CircleAvatar(
      radius: 7,
      backgroundColor: isSelected
          ? Color.fromRGBO(108, 205, 108, 1)
          : Color.fromRGBO(255, 255, 255, 0.5),
    );
  }
}