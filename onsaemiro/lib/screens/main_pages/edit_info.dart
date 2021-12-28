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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이메일',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'onsemiro.gmail.com',
                        hintStyle: TextStyle(fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 53, 0, 34),
                child: Container(
                  width: 93,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ' 이름',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: '온새미로',
                            hintStyle: TextStyle(fontSize: 15),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' 비밀번호',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Image.asset('assets/바로가기 버튼.png'),
                          onPressed: () {},
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 휴대폰 번호',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: '010 - 5768 - 1673',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                            icon: Image.asset('assets/바로가기 버튼.png'),
                            onPressed: () {},
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ],
                ),
              ),
              Container(
                width: 93,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 생년월일',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: '2021.11.18',
                          hintStyle: TextStyle(fontSize: 15),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
