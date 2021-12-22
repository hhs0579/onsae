import 'package:flutter/material.dart';

class agreePage extends StatelessWidget {
  const agreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/Vector.png'),
              ),
              SizedBox(
                width: 95,
              ),
              Text('앱 접근 권한 안내', style: TextStyle(fontSize: 18))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 275,
            height: 330,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Column(
              children: [
                Text('모두 확인,동의합니다.'),
                Text('''원활한 서비스 이용을 위해
                필수 항목 동의가 필요합니다''', style: TextStyle(fontSize: 13)),
                Row(
                  children: [
                    Text('서비스 이용약관 동의 (필수)'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  ],
                ),
                Row(
                  children: [
                    Text('개인정보 수집 동의 (필수)'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  ],
                ),
                Row(
                  children: [
                    Text('개인정보 제3자 제공 동의 (필수)'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text("""서비스를 원할하게 이용하기 위해\n위 항목에 대해 권한이 필요합니다""",
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            width: 100,
            height: 40,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 1.5),
                        borderRadius: BorderRadius.circular(20))),
                child: Text("동의하고 계속 진행합니다")),
          )
        ],
      ),
    ));
  }
}
